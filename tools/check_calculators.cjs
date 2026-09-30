// Validate all calculator configurations using the same safe parser as the site.
const fs = require('node:fs');
const vm = require('node:vm');
const assert = require('node:assert/strict');
const path = require('node:path');
const root = path.resolve(__dirname, '..');
const context = vm.createContext({document: {addEventListener() {}}});
vm.runInContext(fs.readFileSync(path.join(root, 'assets/js/calculators.js'), 'utf8'), context);
const evaluate = context.evaluateExpression;
const definitions = JSON.parse(fs.readFileSync(path.join(__dirname, 'boxed_calculators.json'), 'utf8'));
const cases = [
  ['boxed-013', {m_1:2,m_2:3,v_1i:4,v_2i:-1}, 3],
  ['boxed-045', {P:1000,A:0.01,E:200e9,mu:0.3}, 6e-7],
  ['boxed-047', {nu_first:Math.sqrt(3),nu_second:8}, 1],
  ['boxed-073', {n:2,R:8,T:300,P:100000}, 0.048],
  ['boxed-076', {R:2,T:2,V_m:2,B_0:1,A_0:3,C_0:4,b:2,a:1,alpha:2,c:4,gamma:4}, 2.90625+0.25/Math.E],
  ['boxed-096', {k:200,x:-0.1}, 1],
  ['boxed-101', {m:2,v_com:3,I_com:0.5,omega:4}, 13],
  ['boxed-102', {g:10,I:0.5,m:2,R:0.5}, 5],
  ['boxed-117', {F:0.03,L:0.1}, 0.15],
  ['boxed-125', {R:8,T:300,M:0.03}, 400],
  ['boxed-126', {R:8,T:300,M:0.03}, 800/Math.sqrt(Math.PI)],
  ['boxed-140', {m_0:4,v:3,c:5}, 5],
  ['boxed-054', {E:200e9,nu:0.25}, 80e9],
  ['boxed-002', {k:200,x:0.1}, 1],
  ['boxed-023', {v_i:3,a:2,delta_x:4}, 5],
  ['boxed-066', {T_L:300,T_H:600}, 0.5],
  ['boxed-085', {m:2,g:10,b:4,t:0}, 0],
  ['boxed-129', {C:100}, 212],
  ['boxed-131', {F:32}, 273.15],
  ['boxed-139', {l:10,v:3,c:5}, 8],
  ['boxed-152', {f:100,v_s:340,v_B:0}, 100]
];
for (const [id, values, expected] of cases) {
  const s = definitions.find(x => x.id === id);
  const actual = evaluate(s.expression, {...context.parseConstants(s.constants), ...values});
  assert.ok(Math.abs(actual - expected) < 1e-9, `${id}: ${actual} != ${expected}`);
}
assert.throws(() => evaluate('1/x', {x:0}));
assert.throws(() => evaluate('(0-x)^0.5', {x:1}));
assert.throws(() => evaluate('m*a', {m:2}));
assert.throws(() => evaluate('alert(1)', {}));
const parserCases = [
  ['2*-x', {x:3}, -6], ['2/-x', {x:4}, -0.5],
  ['2*-sin(0.5)', {}, -2*Math.sin(0.5)],
  ['-2^2', {}, -4], ['(-2)^2', {}, 4], ['-x^2', {x:3}, -9],
  ['2^-3', {}, 0.125], ['2^3^2', {}, 512], ['2^-2^2', {}, 1/16],
  ['-(x+1)^2', {x:2}, -9], ['--x + +2', {x:3}, 5],
  ['1--2', {}, 3], ['1e-3 + 2E+2', {}, 200.001],
  ['sin(0)', {}, 0], ['cos(0)', {}, 1], ['tan(0)', {}, 0],
  ['arcsin(1)', {}, Math.PI/2], ['asin(1)', {}, Math.PI/2],
  ['arccos(0)', {}, Math.PI/2], ['acos(0)', {}, Math.PI/2],
  ['arctan(1)', {}, Math.PI/4], ['atan(1)', {}, Math.PI/4],
  ['ln(1)', {}, 0], ['sin(acos(0))', {}, 1],
  ['ln(e^2)', {e:Math.E}, 2], ['sin(-x)^2', {x:0.5}, Math.sin(0.5)**2],
  ['sin + 1', {sin:2}, 3]
];
for (const [expression, values, expected] of parserCases) {
  assert.ok(Math.abs(evaluate(expression, values)-expected) < 1e-12, expression);
}
for (const expression of ['', '()', 'sin()', '1+sin()', '2sin(1)', '2(3)',
  'sin(1,2)', '1 2 +', '1+', 'sin(1', '(1))', 'unknown(1)', 'constructor(1)',
  'ln(0)', 'ln(-1)', 'asin(2)', 'acos(-2)', '1/(1/0)', '1e999']) {
  assert.throws(() => evaluate(expression, {}), undefined, expression);
}
let active = 0, pending = 0;
for (const s of definitions) {
  const source = fs.readFileSync(path.join(root,s.file), 'utf8');
  assert.equal(source.split(`data-boxed-id="${s.id}"`).length - 1, 1, s.id);
  assert.ok(source.includes('\\boxed{'+s.tex+'}'), `Formula differs from definition: ${s.id}`);
  if (s.expression) {
    const marker = source.match(new RegExp('<div\\s+data-calculator=""\\s+data-boxed-id="'+s.id+'"[\\s\\S]*?</div>'))?.[0];
    assert.ok(marker?.includes(`data-expression="${s.expression}"`), `Expression differs from definition: ${s.id}`);
    assert.ok(marker?.includes(`data-inputs="${s.inputs}"`), `Inputs differ from definition: ${s.id}`);
  }
  if (s.pending) { pending++; continue; }
  for (const spec of [s, ...(s.extra ? [s.extra] : [])]) {
    const configured = context.parseInputs(spec.inputs).map(x => x.name);
    const constants = context.parseConstants(spec.constants);
    const tokens = context.tokenize(spec.expression);
    const names = [...new Set(tokens.filter(x => x.type === 'identifier').map(x => x.value))];
    assert.deepEqual([...names].sort(), [...configured, ...Object.keys(constants)].sort(), s.id);
    // Distinct positive samples exercise every expression and all named inputs.
    let finite = false;
    for (let attempt=1; attempt<=20; attempt++) {
      const values = {...constants};
      configured.forEach((name,i) => values[name] = 0.2 + ((i*7+attempt*3)%19)/3);
      try { finite = Number.isFinite(evaluate(spec.expression, values)); } catch {}
      if (finite) break;
    }
    assert.ok(finite, `No finite sample for ${s.id}`);
    active++;
  }
}
console.log(`${definitions.length} boxes covered; ${active} working calculators; ${pending} pending notices; numerical and error checks passed.`);

// Exercise the unchanged form builder with the new evaluator, including error feedback.
function element(tag) {
  return {tag, children: [], attributes: {}, handlers: {}, textContent: '', value: '',
    appendChild(child) { this.children.push(child); },
    setAttribute(name, value) { this.attributes[name] = value; },
    addEventListener(name, handler) { this.handlers[name] = handler; },
    replaceWith(node) { this.replacement = node; }};
}
context.document.createElement = element;
const marker = element('div');
marker.dataset = {expression:'2*-sin(x)', inputs:'x:angle in radians', result:'y',
  unit:'m', note:'Use radians.'};
context.createCalculator(marker);
const form = marker.replacement;
assert.equal(form.attributes['aria-label'], 'Calculate y');
assert.equal(form.children[0].textContent, 'Calculate y');
assert.equal(form.children[1].textContent, 'Use radians.');
const label = form.children[2].children[0];
assert.equal(label.textContent, 'x — angle in radians');
const input = label.children[0];
assert.equal(input.inputMode, 'decimal');
const status = form.children.at(-1);
const submit = () => form.handlers.submit({preventDefault() {}});
submit();
assert.equal(status.textContent, 'Please enter valid numbers.');
input.value = '0.5';
submit();
assert.equal(status.textContent, 'y = -0.9588510772 m');
input.value = 'invalid';
submit();
assert.equal(status.textContent, 'Please enter valid numbers.');
const pendingMarker = element('div');
pendingMarker.dataset = {pending:'Please clarify this formula.'};
context.createCalculator(pendingMarker);
assert.equal(pendingMarker.replacement.className, 'calculator calculator-pending');
assert.equal(pendingMarker.replacement.textContent, 'Calculator pending: Please clarify this formula.');
console.log('Function, unary-sign, precedence, invalid-expression, and form compatibility checks passed.');
