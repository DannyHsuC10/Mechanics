"""Inspect Markdown sources and prepare a clean Jekyll source directory."""
from pathlib import Path
import argparse
import html
import json
import re
import shutil
import os
from urllib.parse import unquote, urlsplit

ROOT = Path(__file__).resolve().parents[1]
SKIP = {'.git', '.obsidian', '.site-check', '.pnpm-store', '_site', '_prepared_site', 'node_modules', 'tools'}

def documents():
    paths=[]
    for directory,subdirs,files in os.walk(ROOT):
        subdirs[:] = [name for name in subdirs if name not in SKIP]
        paths.extend(Path(directory)/name for name in files if name.endswith('.md'))
    return sorted(paths)

def segments(text):
    """Keep fenced blocks and inline code out of prose/math processing."""
    pattern = r'(?m)^([ \t]*)(`{3,}|~{3,})[^\n]*\n[\s\S]*?^\1\2[ \t]*$|(`+)[^`\n]*?\3'
    pos = 0
    for m in re.finditer(pattern, text):
        yield False, text[pos:m.start()], pos
        yield True, m.group(), m.start()
        pos = m.end()
    yield False, text[pos:], pos

def math_spans(text):
    return re.finditer(r'(?<![\\$])\$\$(?!\$)([\s\S]*?)(?<!\\)\$\$|(?<![\\$])\$(?!\$)([^\n$]*?)(?<!\\)\$(?!\$)', text)

def links(text):
    """Yield URL offsets, including balanced parentheses in local filenames."""
    for m in re.finditer(r'\]\(', text):
        start = m.end()
        end, depth = start, 1
        while end < len(text) and depth:
            if text[end] == '(':
                depth += 1
            elif text[end] == ')':
                depth -= 1
            if depth:
                end += 1
        if depth == 0:
            yield start,end,text[start:end]
    for m in re.finditer(r'(?:src|href)\s*=\s*"([^"]*)"', text):
        yield m.start(1),m.end(1),m[1]

def resolve_link(p, target):
    target = unquote(target.strip())
    if not target or target.startswith(('#','http:','https:','mailto:','data:','{{')):
        return None
    target = target.split('#')[0].split('?')[0]
    current = ROOT if target.startswith('/') else p.parent
    for part in Path(target).parts:
        if part in ('.','/','\\'):
            continue
        if part == '..':
            current = current.parent
            continue
        children = {x.name.lower():x for x in current.iterdir()} if current.is_dir() else {}
        if part.lower() in children:
            current = children[part.lower()]
        elif (part+'.md').lower() in children:
            current = children[(part+'.md').lower()]
        else:
            return False
    return current

def audit():
    issues, formulas = [], []
    for p in documents():
        text = p.read_text(encoding='utf-8-sig')
        name = p.relative_to(ROOT).as_posix()
        fence = None
        for n, line in enumerate(text.splitlines(), 1):
            m = re.match(r'^\s*(`{3,}|~{3,})(.*)$', line)
            if m:
                if fence is None:
                    fence = (m[1][0], len(m[1]), n)
                elif m[1][0] == fence[0] and len(m[1]) >= fence[1] and not m[2].strip():
                    fence = None
        if fence:
            issues.append([name, fence[2], 'unclosed code fence'])
        for code, part, offset in segments(text):
            if code:
                continue
            for start,end,url in links(part):
                if name == 'README.md' and url == 'Private/Private.md':
                    # The local-only index is absent in a clean public checkout.
                    continue
                if resolve_link(p,url) is False:
                    # Programming tutorials intentionally demonstrate example URLs.
                    if 'programming' not in p.parts:
                        issues.append([name,text.count('\n',0,offset+start)+1,'missing local link',url])
            covered = []
            for m in math_spans(part):
                tex = m[1] if m[1] is not None else m[2]
                line = text.count('\n', 0, offset+m.start())+1
                formulas.append({'file':name,'line':line,'tex':tex,'display':m[1] is not None})
                covered.append((m.start(),m.end()))
                clean = re.sub(r'\\[{}]', '', tex)
                balance = 0
                for c in clean:
                    balance += (c == '{') - (c == '}')
                    if balance < 0:
                        break
                if balance:
                    issues.append([name,line,'unbalanced TeX braces',tex])
            leftover = part
            for start,end in reversed(covered):
                leftover = leftover[:start]+' '*(end-start)+leftover[end:]
            for m in re.finditer(r'(?<!\\)\$',leftover):
                issues.append([name,text.count('\n',0,offset+m.start())+1,'unmatched dollar'])
    return {'documents':len(documents()),'formulas':formulas,'issues':issues}

def prepare(destination):
    """Build only public source; preserve source Markdown for Obsidian/GitHub."""
    destination = Path(destination).resolve()
    if destination.exists():
        raise SystemExit('Use a new, empty destination directory.')
    public = ['_layouts','assets','Mechanical_Principle','Mechanics_Advanced',
              'Mechanics_Mechanical','Mechanics_Physics','Special']
    destination.mkdir(parents=True)
    for name in public:
        shutil.copytree(ROOT/name,destination/name,ignore=shutil.ignore_patterns('__pycache__','*.pyc'))
    for name in ['_config.yml','README.md','LICENSE']:
        shutil.copy2(ROOT/name,destination/name)
    for p in destination.rglob('*.md'):
        text = p.read_text(encoding='utf-8-sig')
        if p.name == 'README.md' and p.parent == destination:
            text = re.sub(r'^.*\]\(Private/Private\.md\).*\n?', '', text, flags=re.M)
            text = text.replace('layout: base','layout: base\npermalink: /')
        if text.startswith('---\n'):
            heading = re.search(r'^# (.+)$',text,re.M)
            front_end = text.find('\n---',4)
            if heading and front_end > 0 and not re.search(r'^title:',text[:front_end],re.M):
                text = text[:front_end]+'\ntitle: '+json.dumps(heading[1],ensure_ascii=False)+text[front_end:]
        parts = []
        for code, part, _ in segments(text):
            if not code:
                # Transform complete spans so display math is never reinterpreted.
                part = math_spans_sub(part)
                for start,end,url in sorted(links(part),reverse=True):
                    if not url.startswith(('http:','https:','mailto:')):
                        converted = re.sub(r'\.md(?=#|$)', '.html', url)
                        converted = converted.replace('README.html','index.html')
                        part = part[:start]+converted+part[end:]
            parts.append(part)
        p.write_text(''.join(parts),encoding='utf-8')
    print(f'Prepared public website in {destination}')

def math_spans_sub(part):
    for m in reversed(list(math_spans(part))):
        tex = m[1] if m[1] is not None else m[2]
        converted = '$$'+tex+'$$'
        if '{{' in tex or '{%' in tex:
            converted = '{% raw %}'+converted+'{% endraw %}'
        part = part[:m.start()]+converted+part[m.end():]
    return part

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--prepare')
    parser.add_argument('--report')
    args = parser.parse_args()
    if args.prepare:
        prepare(args.prepare)
    else:
        result = audit()
        if args.report:
            Path(args.report).write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
        print(json.dumps({'documents':result['documents'],'formulas':len(result['formulas']),'issues':result['issues']},ensure_ascii=False,indent=2))
        raise SystemExit(bool(result['issues']))
