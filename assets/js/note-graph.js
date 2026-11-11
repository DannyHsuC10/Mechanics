(() => {
  const root = document.getElementById('note-graph');
  const status = root.querySelector('.note-graph-status');
  const topics = {
    Home: ['Home', '#f5f7fb'],
    Mechanics_Physics: ['Physics', '#63b5ff'],
    Mechanics_Mechanical: ['Engineering', '#4fd5b0'],
    Mechanics_Advanced: ['Advanced', '#c9a2ff'],
    Mechanical_Principle: ['Machine elements', '#ffc478'],
    Special: ['Special', '#f399bd'],
  };

  function arrange(nodes, edges, sections) {
    const subjects = sections.filter((section) => section !== 'Home');
    const offsets = new Map();
    nodes.forEach((node) => {
      const index = subjects.indexOf(node.section);
      const angle = -Math.PI / 2 + 2 * Math.PI * index / subjects.length;
      const offset = offsets.get(node.section) || 0;
      offsets.set(node.section, offset + 1);
      node.anchorX = index < 0 ? 0 : 225 * Math.cos(angle);
      node.anchorY = index < 0 ? 0 : 155 * Math.sin(angle);
      node.x = node.anchorX + 12 * Math.sqrt(offset) * Math.cos(offset * 2.4);
      node.y = node.anchorY + 12 * Math.sqrt(offset) * Math.sin(offset * 2.4);
    });

    // Pull linked notes together while preserving recognizable subject clusters.
    for (let step = 0; step < 100; step++) {
      const cooling = 1 - 0.9 * step / 100;
      nodes.forEach((node) => {
        node.dx = (node.anchorX - node.x) * 0.045;
        node.dy = (node.anchorY - node.y) * 0.045;
      });
      for (let i = 0; i < nodes.length; i++) {
        for (let j = i + 1; j < nodes.length; j++) {
          const a = nodes[i];
          const b = nodes[j];
          const dx = b.x - a.x;
          const dy = b.y - a.y;
          const push = 230 / Math.max(dx * dx + dy * dy, 16);
          a.dx -= dx * push;
          a.dy -= dy * push;
          b.dx += dx * push;
          b.dy += dy * push;
        }
      }
      edges.forEach(([a, b]) => {
        const dx = b.x - a.x;
        const dy = b.y - a.y;
        const distance = Math.hypot(dx, dy) || 1;
        const rest = a.section === b.section ? 43 : 140;
        const pull = 0.075 * (distance - rest) / distance;
        a.dx += dx * pull;
        a.dy += dy * pull;
        b.dx -= dx * pull;
        b.dy -= dy * pull;
      });
      nodes.forEach((node) => {
        node.x += cooling * Math.max(-18, Math.min(18, node.dx));
        node.y += cooling * Math.max(-18, Math.min(18, node.dy));
      });
    }
  }

  function svgElement(tag, attributes) {
    const element = document.createElementNS('http://www.w3.org/2000/svg', tag);
    Object.entries(attributes).forEach(([name, value]) => element.setAttribute(name, value));
    return element;
  }

  function render(data) {
    const svg = root.querySelector('svg');
    const world = root.querySelector('.note-graph-world');
    const controls = root.querySelector('.note-graph-controls');
    const search = controls.querySelector('input');
    const legend = root.querySelector('.note-graph-legend');
    const siteRoot = new URL(root.dataset.siteRoot, document.baseURI);
    const nodes = data.nodes;
    const edges = data.edges.map(([a, b]) => [nodes[a], nodes[b]]);
    const sections = [...new Set(nodes.map((node) => node.section))];
    const topic = (section) => topics[section] || [section.replaceAll('_', ' '), '#a9c5d8'];
    const camera = {x: 0, y: 0, scale: 1};
    const filters = new Map();
    let width, height, visibleNodes, visibleEdges;
    let sectionFilter = '';
    let hovered = null;
    let focused = null;
    let pan = null;
    let dragged = false;

    arrange(nodes, edges, sections);
    nodes.forEach((node) => { node.neighbors = new Set(); });
    const lines = edges.map(([a, b]) => {
      a.neighbors.add(b);
      b.neighbors.add(a);
      const line = svgElement('line', {x1: a.x, y1: a.y, x2: b.x, y2: b.y});
      world.append(line);
      return line;
    });
    nodes.forEach((node) => {
      const radius = 6.7 + Math.min(6.5, Math.sqrt(node.neighbors.size) * 1.5);
      node.link = svgElement('a', {
        href: new URL(node.path, siteRoot).href,
        'aria-label': node.title,
        class: 'note-graph-node',
      });
      const tooltip = svgElement('title', {});
      tooltip.textContent = node.title;
      const dot = svgElement('circle', {cx: node.x, cy: node.y, r: radius, fill: topic(node.section)[1]});
      node.link.append(tooltip, dot);
      world.append(node.link);
      node.link.addEventListener('pointerenter', () => { hovered = node; emphasize(); });
      node.link.addEventListener('pointerleave', () => { hovered = null; emphasize(); });
      node.link.addEventListener('focus', () => { focused = node; emphasize(); });
      node.link.addEventListener('blur', () => { focused = null; emphasize(); });
    });

    function emphasize() {
      const active = hovered || focused;
      nodes.forEach((node) => {
        node.link.classList.toggle('is-muted', !!active && node !== active && !active.neighbors.has(node));
        node.link.classList.toggle('is-active', node === active);
      });
      edges.forEach(([a, b], index) => {
        lines[index].classList.toggle('is-muted', !!active && a !== active && b !== active);
        lines[index].classList.toggle('is-active', a === active || b === active);
      });
      const count = visibleNodes.length === nodes.length ? nodes.length : `${visibleNodes.length} of ${nodes.length}`;
      status.textContent = active ? active.title : visibleNodes.length
        ? `${count} notes · ${visibleEdges} links`
        : 'No notes match your search.';
    }

    function moveCamera() {
      world.setAttribute('transform', `translate(${camera.x} ${camera.y}) scale(${camera.scale})`);
    }

    function fit() {
      if (!visibleNodes.length || !width || !height) return;
      const xs = visibleNodes.map((node) => node.x);
      const ys = visibleNodes.map((node) => node.y);
      const left = Math.min(...xs);
      const right = Math.max(...xs);
      const top = Math.min(...ys);
      const bottom = Math.max(...ys);
      camera.scale = Math.min(width / (right - left + 64), height / (bottom - top + 64), 1.7);
      camera.x = width / 2 - (left + right) / 2 * camera.scale;
      camera.y = height / 2 - (top + bottom) / 2 * camera.scale;
      moveCamera();
    }

    function zoom(factor, x = width / 2, y = height / 2) {
      const scale = Math.max(0.12, Math.min(5, camera.scale * factor));
      camera.x = x - (x - camera.x) * scale / camera.scale;
      camera.y = y - (y - camera.y) * scale / camera.scale;
      camera.scale = scale;
      moveCamera();
    }

    function filter() {
      const query = search.value.trim().toLocaleLowerCase();
      hovered = focused = null;
      visibleNodes = nodes.filter((node) => {
        node.visible = (!sectionFilter || sectionFilter === node.section) && node.title.toLocaleLowerCase().includes(query);
        node.link.classList.toggle('is-hidden', !node.visible);
        return node.visible;
      });
      visibleEdges = 0;
      edges.forEach(([a, b], index) => {
        const visible = a.visible && b.visible;
        lines[index].classList.toggle('is-hidden', !visible);
        if (visible) visibleEdges++;
      });
      emphasize();
      fit();
    }

    function addFilter(section, label, color) {
      const button = document.createElement('button');
      button.type = 'button';
      button.textContent = label;
      button.setAttribute('aria-pressed', String(!section));
      if (color) button.style.setProperty('--note-color', color);
      button.addEventListener('click', () => {
        sectionFilter = section;
        filters.forEach((control, value) => control.setAttribute('aria-pressed', String(value === section)));
        filter();
      });
      filters.set(section, button);
      legend.append(button);
    }

    addFilter('', 'All notes');
    sections.forEach((section) => addFilter(section, ...topic(section)));
    search.addEventListener('input', filter);
    search.addEventListener('keydown', (event) => {
      if (event.key === 'Enter' && visibleNodes.length === 1) window.location.assign(visibleNodes[0].link.getAttribute('href'));
    });
    controls.querySelector('[data-zoom="out"]').addEventListener('click', () => zoom(1 / 1.35));
    controls.querySelector('[data-zoom="in"]').addEventListener('click', () => zoom(1.35));
    controls.querySelector('[data-zoom="fit"]').addEventListener('click', fit);

    svg.addEventListener('wheel', (event) => {
      if (!event.ctrlKey) return;
      event.preventDefault();
      const rect = svg.getBoundingClientRect();
      zoom(event.deltaY < 0 ? 1.15 : 1 / 1.15, event.clientX - rect.left, event.clientY - rect.top);
    }, {passive: false});
    svg.addEventListener('pointerdown', (event) => {
      if (event.button !== 0 || !event.isPrimary) return;
      dragged = false;
      pan = {id: event.pointerId, x: event.clientX, y: event.clientY, startX: camera.x, startY: camera.y};
    });
    svg.addEventListener('pointermove', (event) => {
      if (!pan || pan.id !== event.pointerId) return;
      const dx = event.clientX - pan.x;
      const dy = event.clientY - pan.y;
      if (!dragged && Math.hypot(dx, dy) < 5) return;
      if (!dragged) svg.setPointerCapture(event.pointerId);
      dragged = true;
      camera.x = pan.startX + dx;
      camera.y = pan.startY + dy;
      moveCamera();
    });
    ['pointerup', 'pointercancel', 'pointerleave'].forEach((name) => {
      svg.addEventListener(name, (event) => {
        if (pan?.id === event.pointerId) pan = null;
      });
    });
    svg.addEventListener('click', (event) => {
      if (dragged && event.detail) event.preventDefault();
    }, true);

    controls.hidden = legend.hidden = root.querySelector('.note-graph-plot').hidden = false;
    filter();
    new ResizeObserver(([entry]) => {
      ({width, height} = entry.contentRect);
      if (!width || !height) return;
      svg.setAttribute('viewBox', `0 0 ${width} ${height}`);
      fit();
    }).observe(svg);
  }

  fetch(root.dataset.source)
    .then((response) => {
      if (!response.ok) throw new Error(`HTTP ${response.status}`);
      return response.json();
    })
    .then(render)
    .catch(() => { status.textContent = 'The note graph could not load.'; });
})();
