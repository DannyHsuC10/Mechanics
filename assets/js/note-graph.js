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
  const attachmentColors = {matlab: '#f1aa5e', image: '#9cbed4'};

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

  function placeAttachments(notes, attachments) {
    const minLinkDistance = 42;
    const placed = [...notes];
    attachments.forEach((node, index) => {
      const sources = [...node.neighbors];
      const x = sources.reduce((sum, source) => sum + source.x, 0) / sources.length;
      const y = sources.reduce((sum, source) => sum + source.y, 0) / sources.length;
      let step = 0;
      do {
        const angle = (index + step) * 2.4;
        const radius = minLinkDistance + 3 + 8 * Math.sqrt(step);
        node.x = x + radius * Math.cos(angle);
        node.y = y + radius * Math.sin(angle);
        step++;
      } while (placed.some((other) => {
        const spacing = node.neighbors.has(other) ? minLinkDistance : 17;
        return (node.x - other.x) ** 2 + (node.y - other.y) ** 2 < spacing ** 2;
      }));
      placed.push(node);
    });
  }

  function svgElement(tag, attributes) {
    const element = document.createElementNS('http://www.w3.org/2000/svg', tag);
    Object.entries(attributes).forEach(([name, value]) => element.setAttribute(name, value));
    return element;
  }

  function render(data) {
    const svg = root.querySelector('svg');
    const world = root.querySelector('.note-graph-world');
    const preview = document.querySelector('.note-graph-preview');
    const previewSvg = preview.querySelector('svg');
    const previewWorld = previewSvg.querySelector('g');
    const controls = root.querySelector('.note-graph-controls');
    const search = controls.querySelector('input');
    const legend = root.querySelector('.note-graph-legend');
    const attachmentControls = root.querySelector('.note-graph-attachments');
    const attachmentInputs = [...attachmentControls.querySelectorAll('input')];
    const siteRoot = new URL(root.dataset.siteRoot, document.baseURI);
    const nodes = data.nodes;
    const edges = data.edges.map(([a, b]) => [nodes[a], nodes[b]]);
    const notes = nodes.filter((node) => node.kind === 'note');
    const attachments = nodes.filter((node) => node.kind !== 'note');
    const sections = [...new Set(notes.map((node) => node.section))];
    const topic = (section) => topics[section] || [section.replaceAll('_', ' '), '#a9c5d8'];
    const camera = {x: 0, y: 0, scale: 1};
    const filters = new Map();
    let width, height, visibleNodes, matches, summary;
    let sectionFilter = '';
    let hovered = null;
    let focused = null;
    let pan = null;
    let dragged = false;

    nodes.forEach((node) => {
      node.neighbors = new Set();
      node.url = new URL(node.path, siteRoot).href;
      node.searchText = `${node.title} ${node.path.split('/').pop()}`.toLocaleLowerCase();
    });
    edges.forEach(([a, b]) => {
      a.neighbors.add(b);
      b.neighbors.add(a);
    });
    arrange(notes, edges.filter(([a, b]) => a.kind === 'note' && b.kind === 'note'), sections);
    placeAttachments(notes, attachments);

    const lines = edges.map(([a, b]) => [world, previewWorld].map((layer) => {
      const line = svgElement('line', {x1: a.x, y1: a.y, x2: b.x, y2: b.y});
      layer.append(line);
      return line;
    }));
    nodes.forEach((node) => {
      const isNote = node.kind === 'note';
      const radius = isNote ? 6.7 + Math.min(6.5, Math.sqrt(node.neighbors.size) * 1.5) : 5.7;
      const color = isNote ? topic(node.section)[1] : attachmentColors[node.kind];
      node.links = [world, previewWorld].map((layer) => {
        const link = svgElement('a', {
          href: node.url,
          'aria-label': node.title,
          class: 'note-graph-node',
          'data-kind': node.kind,
        });
        if (layer === previewWorld) link.setAttribute('tabindex', '-1');
        const tooltip = svgElement('title', {});
        tooltip.textContent = node.title;
        const dot = svgElement('circle', {cx: node.x, cy: node.y, r: radius, fill: color});
        link.append(tooltip, dot);
        layer.append(link);
        link.addEventListener('pointerenter', () => { hovered = node; emphasize(); });
        link.addEventListener('pointerleave', () => { hovered = null; emphasize(); });
        link.addEventListener('focus', () => { focused = node; emphasize(); });
        link.addEventListener('blur', () => { focused = null; emphasize(); });
        return link;
      });
    });

    function emphasize() {
      const active = hovered || focused;
      nodes.forEach((node) => node.links.forEach((link) => {
        link.classList.toggle('is-muted', !!active && node !== active && !active.neighbors.has(node));
        link.classList.toggle('is-active', node === active);
      }));
      edges.forEach(([a, b], index) => lines[index].forEach((line) => {
        line.classList.toggle('is-muted', !!active && a !== active && b !== active);
        line.classList.toggle('is-active', a === active || b === active);
      }));
      status.textContent = active?.title || summary;
    }

    function moveCamera() {
      world.setAttribute('transform', `translate(${camera.x} ${camera.y}) scale(${camera.scale})`);
    }

    function fit() {
      if (!visibleNodes.length) return;
      const xs = visibleNodes.map((node) => node.x);
      const ys = visibleNodes.map((node) => node.y);
      const left = Math.min(...xs);
      const right = Math.max(...xs);
      const top = Math.min(...ys);
      const bottom = Math.max(...ys);
      previewSvg.setAttribute('viewBox', `${left - 26} ${top - 26} ${right - left + 52} ${bottom - top + 52}`);
      if (!width || !height) return;
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
      const shownKinds = new Set(attachmentInputs.filter((input) => input.checked).map((input) => input.value));
      const inSection = (note) => !sectionFilter || note.section === sectionFilter;
      const eligible = new Set(nodes.filter((node) => node.kind === 'note' ? inSection(node) :
        shownKinds.has(node.kind) && [...node.neighbors].some(inSection)));
      matches = [...eligible].filter((node) => node.searchText.includes(query));
      const visible = new Set(matches);
      if (query) {
        matches.forEach((node) => node.neighbors.forEach((neighbor) => {
          if (eligible.has(neighbor) && (node.kind !== 'note' || neighbor.kind !== 'note')) visible.add(neighbor);
        }));
      }
      visibleNodes = [...visible];
      nodes.forEach((node) => node.links.forEach((link) => link.classList.toggle('is-hidden', !visible.has(node))));
      let visibleEdges = 0;
      edges.forEach(([a, b], index) => {
        const show = visible.has(a) && visible.has(b);
        lines[index].forEach((line) => line.classList.toggle('is-hidden', !show));
        if (show) visibleEdges++;
      });
      const noteCount = visibleNodes.filter((node) => node.kind === 'note').length;
      summary = visibleNodes.length
        ? `${noteCount} notes · ${visibleNodes.length - noteCount} files · ${visibleEdges} links`
        : 'No notes or files match your search.';
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

    addFilter('', 'All subjects');
    sections.forEach((section) => addFilter(section, ...topic(section)));
    attachmentInputs.forEach((input) => input.addEventListener('change', filter));
    search.addEventListener('input', filter);
    search.addEventListener('keydown', (event) => {
      if (event.key === 'Enter' && matches.length === 1) window.location.assign(matches[0].url);
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

    controls.hidden = legend.hidden = attachmentControls.hidden = preview.hidden = root.querySelector('.note-graph-plot').hidden = false;
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
