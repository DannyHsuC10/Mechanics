"""Validate public Jekyll output, local links, images, and preserved math."""
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import quote, unquote, urlsplit
import json
import html
import re
import os
import sys
from site_content import PAUSED_SECTIONS, PUBLIC_SECTIONS, ROOT, documents, segments, math_spans

IMAGE_EXTENSIONS = {'.avif', '.bmp', '.gif', '.ico', '.jpeg', '.jpg', '.png', '.svg', '.tif', '.tiff', '.webp'}

class Page(HTMLParser):
    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.urls=[]
        self.formulas=[]
        self.current=None
        self.ids=set()
        self.in_main=False
        self.skip=0
        self.text=[]
        self.title=''
        self.in_title=False
        self.graph_links={}
        self.graph_targets={}
    def handle_starttag(self,tag,attrs):
        attrs=dict(attrs)
        if tag=='main': self.in_main=True
        if tag=='title': self.in_title=True
        if tag in ('pre','code'): self.skip+=1
        if 'id' in attrs: self.ids.add(attrs['id'])
        for key in ('href','src'):
            if attrs.get(key): self.urls.append(attrs[key])
        if self.in_main and not self.skip:
            if tag=='a' and attrs.get('href'):
                self.graph_links.setdefault(attrs['href'], None)
            if tag=='img' and attrs.get('src'):
                self.graph_links[attrs['src']]=attrs.get('alt') or ''
        if tag=='script' and attrs.get('type','').startswith('math/tex'):
            self.current={'tex':'','display':'mode=display' in attrs['type']}
    def handle_data(self,data):
        if self.current is not None: self.current['tex']+=data
        elif self.in_title: self.title+=data
        elif self.in_main and not self.skip: self.text.append(data)
    def handle_endtag(self,tag):
        if tag=='main': self.in_main=False
        if tag=='title': self.in_title=False
        if tag in ('pre','code'): self.skip=max(0,self.skip-1)
        if tag=='script' and self.current is not None:
            self.formulas.append(self.current)
            self.current=None

def attachment_node(target, alt, destination):
    if isinstance(target, Path):
        path = quote(target.relative_to(destination).as_posix())
        name = target.name
    else:
        path = target
        url = urlsplit(path)
        name = Path(unquote(url.path)).name or url.netloc

    extension = Path(name).suffix.lower()
    if alt is not None or extension in IMAGE_EXTENSIONS:
        title = alt.strip() if alt else ''
        if title.lower() in {'image', 'img', 'figure'}:
            title = ''
        return {'path': path, 'title': title or name, 'kind': 'image'}
    if extension == '.m':
        return {'path': path, 'title': name, 'kind': 'matlab'}

destination=ROOT/(sys.argv[1] if len(sys.argv)>1 else '_site')
baseurl=os.environ.get('SITE_BASEURL','').rstrip('/')
pages={}
issues=[]
formulas=[]
case_paths={p.relative_to(destination).as_posix() for p in destination.rglob('*') if p.is_file()}
for p in destination.rglob('*.html'):
    parsed=Page()
    parsed.feed(p.read_text(encoding='utf-8'))
    for m in re.finditer(r'\\\[([\s\S]*?)\\\]|\\\(([\s\S]*?)\\\)', ''.join(parsed.text)):
        parsed.formulas.append({'tex':m[1] if m[1] is not None else m[2],'display':m[1] is not None})
    pages[p.resolve()]=parsed
for p,parsed in pages.items():
    for url in parsed.urls:
        ref=urlsplit(url)
        if ref.scheme or ref.netloc:
            if ref.netloc and ref.scheme in ('', 'http', 'https') and url in parsed.graph_links:
                parsed.graph_targets[url]=parsed.graph_links[url]
            continue
        urlpath=unquote(ref.path)
        if baseurl and (urlpath==baseurl or urlpath.startswith(baseurl+'/')):
            urlpath=urlpath[len(baseurl):] or '/'
        target=(destination/urlpath.lstrip('/') if urlpath.startswith('/') else p.parent/urlpath).resolve() if urlpath else p
        if target.is_dir(): target=target/'index.html'
        if not target.exists(): issues.append([str(p.relative_to(destination)),'missing target',url])
        elif target.is_relative_to(destination) and target.relative_to(destination).as_posix() not in case_paths:
            issues.append([str(p.relative_to(destination)),'incorrect path case',url])
        elif ref.fragment and target in pages and unquote(ref.fragment) not in pages[target].ids:
            issues.append([str(p.relative_to(destination)),'missing anchor',url])
        elif target != p and target.is_relative_to(destination) and url in parsed.graph_links:
            parsed.graph_targets[target]=parsed.graph_links[url]
    formulas.extend(dict(f,file=str(p.relative_to(destination)),line=0) for f in parsed.formulas)
public=PUBLIC_SECTIONS | {'README.md'}
expected_pages=0
notes={}
for p in documents():
    if p.relative_to(ROOT).parts[0] not in public: continue
    expected_pages+=1
    target=(destination/('index.html' if p.name=='README.md' else p.relative_to(ROOT).with_suffix('.html'))).resolve()
    if target not in pages:
        issues.append([str(p.relative_to(ROOT)),'missing page'])
        continue
    path = target.relative_to(destination).as_posix()
    notes[target] = {
        'path': quote(path),
        'title': pages[target].title.strip().removesuffix(' | Mechanics') or p.stem,
        'kind': 'note',
        'section': path.split('/', 1)[0] if '/' in path else 'Home',
    }
    expected=[m[1] if m[1] is not None else m[2] for code,part,_ in segments(p.read_text(encoding='utf-8')) if not code for m in math_spans(part)]
    actual=[f['tex'] for f in pages[target].formulas]
    normalize=lambda s: ' '.join(s.split())
    if list(map(normalize,expected))!=list(map(normalize,actual)):
        issues.append([str(p.relative_to(ROOT)),'math changed during Markdown rendering',len(expected),len(actual)])
for name in sorted(PAUSED_SECTIONS | {'Private','Webpage_package','tools','python_Document_Management_Tools'}):
    if (destination/name).exists(): issues.append([name,'unexpected published directory'])
(ROOT/'.site-check').mkdir(exist_ok=True)
(ROOT/'.site-check/rendered-math.json').write_text(json.dumps({'formulas':formulas}),encoding='utf-8')
if not issues:
    nodes = list(notes.values())
    node_ids = {path: index for index, path in enumerate(notes)}
    edges = set()
    for source in notes:
        notes[source]['outgoing'] = [
            node_ids[target]
            for target, alt in pages[source].graph_targets.items()
            if target in notes and alt is None
        ]
        for target, alt in pages[source].graph_targets.items():
            if target not in node_ids:
                attachment = attachment_node(target, alt, destination)
                if attachment is None:
                    continue
                node_ids[target] = len(nodes)
                nodes.append(attachment)
            edges.add(tuple(sorted((node_ids[source], node_ids[target]))))
    graph = {'nodes': nodes, 'edges': sorted(edges)}
    (destination/'assets/note-graph.json').write_text(json.dumps(graph, ensure_ascii=False), encoding='utf-8')
print(json.dumps({'expected_pages':expected_pages,'rendered_pages':len(pages),'rendered_formulas':len(formulas),'issues':issues},indent=2))
raise SystemExit(bool(issues))
