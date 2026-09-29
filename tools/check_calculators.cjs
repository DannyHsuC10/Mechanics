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
let active = 0, pending = 0;
for (const s of definitions) {
  const source = fs.readFileSync(path.join(root,s.file), 'utf8');
  assert.equal(source.split(`data-boxed-id="${s.id}"`).length - 1, 1, s.id);
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
