// Run after: python tools/site_content.py --report .site-check/audit.json
// Validation dependencies are local to .site-check (see tools/README.md).
const fs = require('node:fs');
const path = require('node:path');
const {createRequire} = require('node:module');
const root = path.resolve(__dirname, '..');
const local = createRequire(path.join(root, '.site-check', 'package.json'));
const {mathjax} = local('mathjax-full/js/mathjax.js');
const {TeX} = local('mathjax-full/js/input/tex.js');
const {SVG} = local('mathjax-full/js/output/svg.js');
const {liteAdaptor} = local('mathjax-full/js/adaptors/liteAdaptor.js');
const {RegisterHTMLHandler} = local('mathjax-full/js/handlers/html.js');
const {AllPackages} = local('mathjax-full/js/input/tex/AllPackages.js');
const adaptor = liteAdaptor();
RegisterHTMLHandler(adaptor);
const errors = [];
let current;
const tex = new TeX({packages: AllPackages.filter(p => !['noerrors','noundefined'].includes(p)),
  formatError: (jax, error) => { errors.push({...current,error:error.message}); return jax.formatError(error); }
});
const document = mathjax.document('',{InputJax:tex,OutputJax:new SVG({fontCache:'none'})});
const data = JSON.parse(fs.readFileSync(path.resolve(root,process.argv[2] || '.site-check/audit.json'),'utf8'));
for (const formula of data.formulas) {
  current = formula;
  try { document.convert(formula.tex,{display:formula.display}); }
  catch(error) { errors.push({...formula,error:error.message}); }
}
fs.writeFileSync(path.join(root,'.site-check/math-errors.json'),JSON.stringify(errors,null,2));
console.log(JSON.stringify({checked:data.formulas.length,errors},null,2));
process.exitCode = errors.length ? 1 : 0;
