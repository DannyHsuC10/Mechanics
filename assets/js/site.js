// Kramdown emits legacy MathJax script elements. Convert them before MathJax 3 starts.
document.querySelectorAll('script[type^="math/tex"]').forEach((source) => {
  const display = source.type.includes('mode=display');
  const target = document.createElement(display ? 'div' : 'span');
  target.className = display ? 'math-display' : 'math-inline';
  target.textContent = `${display ? '\\[' : '\\('}${source.textContent}${display ? '\\]' : '\\)'}`;
  source.replaceWith(target);
});

const toc = document.getElementById('page-toc');
const headings = [...document.querySelectorAll('main h2')];
if (toc && headings.length) {
  const label = document.createElement('p');
  label.textContent = 'On this page';
  const list = document.createElement('ul');
  headings.forEach((heading, index) => {
    if (!heading.id) heading.id = `section-${index + 1}`;
    const item = document.createElement('li');
    const link = document.createElement('a');
    link.href = `#${heading.id}`;
    link.textContent = heading.textContent;
    item.appendChild(link);
    list.appendChild(item);
  });
  toc.append(label, list);
}

// Only load the diagram renderer on pages that contain a Mermaid diagram.
const diagrams = document.querySelectorAll('pre code.language-mermaid');
if (diagrams.length) {
  diagrams.forEach((code) => {
    const container = document.createElement('div');
    container.className = 'mermaid';
    container.textContent = code.textContent;
    code.parentElement.replaceWith(container);
  });
  const script = document.createElement('script');
  script.src = 'https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.min.js';
  script.onload = () => window.mermaid.initialize({startOnLoad: true, theme: 'default'});
  document.head.appendChild(script);
}
