const pageHeader = document.querySelector('.page-header');
if (pageHeader) {
  const updateHeaderHeight = () => {
    const height = pageHeader.getBoundingClientRect().height;
    document.documentElement.style.setProperty('--page-header-height', `${height}px`);
  };
  updateHeaderHeight();
  new ResizeObserver(updateHeaderHeight).observe(pageHeader);
}

// Kramdown emits legacy MathJax script elements. Convert them before MathJax 3 starts.
document.querySelectorAll('script[type^="math/tex"]').forEach((source) => {
  const display = source.type.includes('mode=display');
  const target = document.createElement(display ? 'div' : 'span');
  target.className = display ? 'math-display' : 'math-inline';
  target.textContent = `${display ? '\\[' : '\\('}${source.textContent}${display ? '\\]' : '\\)'}`;
  source.replaceWith(target);
});

// Navigate through browser history; this control never falls back to Home.
const backLink = document.getElementById('back-link');
if (backLink) {
  const updateBackLink = () => {
    backLink.disabled = window.history.length <= 1;
    backLink.title = backLink.disabled ? 'No previous page in this tab' : 'Back to previous page';
  };
  updateBackLink();
  window.addEventListener('pageshow', updateBackLink);
  backLink.addEventListener('click', () => {
    if (window.history.length > 1) {
      window.history.back();
    }
  });
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
