"""Insert reviewed calculator definitions immediately after boxed math blocks."""
import html
import argparse
import json
import re
from collections import defaultdict
from pathlib import Path
from site_content import ROOT, documents, segments, math_spans


def boxed_formulas(directory=None):
    found = []
    paths = sorted(directory.rglob('*.md')) if directory else documents()
    for path in paths:
        text = path.read_text(encoding='utf-8-sig')
        for code, part, offset in segments(text):
            if code:
                continue
            for math in math_spans(part):
                for box in re.finditer(r'\\boxed\s*\{', math.group()):
                    start = i = box.end()
                    depth = 1
                    while depth and i < len(math.group()):
                        depth += (math.group()[i] == '{') - (math.group()[i] == '}')
                        i += 1
                    found.append({'file': path.relative_to(ROOT).as_posix(),
                                  'tex': math.group()[start:i-1], 'end': offset + math.end()})
    return found


def main(directory=None):
    specs = json.loads((Path(__file__).with_name('boxed_calculators.json')).read_text(encoding='utf-8'))
    by_key = defaultdict(list)
    for spec in specs:
        by_key[(spec['file'], spec['tex'])].append(spec)
    edits = defaultdict(list)
    boxes = boxed_formulas(directory)
    missing = [b for b in boxes if (b['file'], b['tex']) not in by_key]
    if missing:
        raise SystemExit('Unconfigured boxed formulas: ' + repr(missing))
    for box in boxes:
        spec = by_key[(box['file'], box['tex'])].pop(0)
        attrs = {'data-calculator': '', 'data-boxed-id': spec['id']}
        if 'pending' in spec:
            attrs['data-pending'] = spec['pending']
        else:
            attrs.update({'data-expression': spec['expression'], 'data-inputs': spec['inputs'],
                          'data-result': spec['result'], 'data-unit': spec.get('unit', ''),
                          'data-constants': spec.get('constants', '')})
        attrs['data-note'] = spec.get('note', 'Enter the variables in consistent SI units. The calculator evaluates the boxed expression.')
        marker = '<div\n' + '\n'.join('  '+k+'="'+html.escape(str(v), quote=True)+'"' for k,v in attrs.items()) + '>\n</div>'
        if 'extra' in spec:
            extra = {'data-calculator': '', 'data-boxed-id': spec['id']+'-extra'}
            extra.update({'data-'+k:v for k,v in spec['extra'].items()})
            marker += '\n\n<div\n' + '\n'.join('  '+k+'="'+html.escape(str(v), quote=True)+'"' for k,v in extra.items()) + '>\n</div>'
        edits[box['file']].append((box['end'], spec['id'], marker))
    for name, changes in edits.items():
        path = ROOT / name
        text = path.read_text(encoding='utf-8-sig')
        for end, key, marker in sorted(changes, reverse=True):
            if f'data-boxed-id="{key}"' in text:
                continue
            text = text[:end] + '\n\n' + marker + text[end:]
        with path.open('w', encoding='utf-8', newline='') as f:
            f.write(text)
    print(f'Covered {len(boxes)} boxed expressions in {len(edits)} pages.')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--directory', help='Limit insertion to this repository directory.')
    args = parser.parse_args()
    directory = (ROOT / args.directory).resolve() if args.directory else None
    if directory and (not directory.is_relative_to(ROOT) or not directory.is_dir()):
        parser.error('--directory must be an existing directory inside the repository')
    main(directory)
