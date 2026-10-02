"""Validate public Jekyll output, local links, images, and preserved math."""
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import unquote, urlsplit
import json
import html
import re
import os
import sys
from site_content import ROOT, documents, segments, math_spans

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
    def handle_starttag(self,tag,attrs):
        attrs=dict(attrs)
        if tag=='main': self.in_main=True
        if tag in ('pre','code'): self.skip+=1
        if 'id' in attrs: self.ids.add(attrs['id'])
        for key in ('href','src'):
            if attrs.get(key): self.urls.append(attrs[key])
        if tag=='script' and attrs.get('type','').startswith('math/tex'):
            self.current={'tex':'','display':'mode=display' in attrs['type']}
    def handle_data(self,data):
        if self.current is not None: self.current['tex']+=data
        elif self.in_main and not self.skip: self.text.append(data)
    def handle_endtag(self,tag):
        if tag=='main': self.in_main=False
        if tag in ('pre','code'): self.skip=max(0,self.skip-1)
        if tag=='script' and self.current is not None:
            self.formulas.append(self.current)
            self.current=None

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
        if url.startswith(('http:','https:','mailto:','data:','javascript:')): continue
        ref=urlsplit(url)
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
    formulas.extend(dict(f,file=str(p.relative_to(destination)),line=0) for f in parsed.formulas)
public={'Mechanical_Principle','Mechanics_Advanced','Mechanics_Mechanical','Mechanics_Physics','Special','RCVD','README.md'}
expected_pages=0
for p in documents():
    if p.relative_to(ROOT).parts[0] not in public: continue
    expected_pages+=1
    target=(destination/('index.html' if p.name=='README.md' else p.relative_to(ROOT).with_suffix('.html'))).resolve()
    if target not in pages:
        issues.append([str(p.relative_to(ROOT)),'missing page'])
        continue
    expected=[m[1] if m[1] is not None else m[2] for code,part,_ in segments(p.read_text(encoding='utf-8')) if not code for m in math_spans(part)]
    actual=[f['tex'] for f in pages[target].formulas]
    normalize=lambda s: ' '.join(s.split())
    if list(map(normalize,expected))!=list(map(normalize,actual)):
        issues.append([str(p.relative_to(ROOT)),'math changed during Markdown rendering',len(expected),len(actual)])
for name in ['Private','Webpage_package','tools','python_Document_Management_Tools']:
    if (destination/name).exists(): issues.append([name,'unexpected published directory'])
(ROOT/'.site-check').mkdir(exist_ok=True)
(ROOT/'.site-check/rendered-math.json').write_text(json.dumps({'formulas':formulas}),encoding='utf-8')
print(json.dumps({'expected_pages':expected_pages,'rendered_pages':len(pages),'rendered_formulas':len(formulas),'issues':issues},indent=2))
raise SystemExit(bool(issues))
