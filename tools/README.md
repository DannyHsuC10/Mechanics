# Website maintenance

The Markdown files remain suitable for GitHub and Obsidian. The website build prepares a separate public source tree, converting inline math to Kramdown syntax and changing local Markdown links to HTML links. It does not publish `Private`, the theme package's demonstration pages, or maintenance tools.

## Source checks

Run from the repository root:

```sh
python tools/site_content.py
```

This checks code fences, math delimiters, TeX braces, and local link destinations. Intentional example links in the private programming tutorials are excluded from destination checks. External URLs are not fetched.

For a full TeX syntax check, install `mathjax-full@3.2.2` in the ignored `.site-check` directory using npm or pnpm, then run:

```sh
python tools/site_content.py --report .site-check/audit.json
node tools/check_math.cjs
```

These checks validate syntax, not the physical correctness of a formula.

## Build

```sh
python tools/site_content.py --prepare _prepared_site
cd _prepared_site
jekyll build --destination ../_site
cd ..
python tools/check_build.py
```

The preparation command requires a new destination directory so it cannot silently overwrite an existing build. GitHub Actions uses a fresh checkout and runs these steps with the GitHub Pages Jekyll builder. Local builds require Jekyll, `kramdown-parser-gfm`, and `jekyll-theme-architect`.

Modern Kramdown emits MathJax delimiters directly. The `site.js` adapter also supports the legacy math script elements emitted by older GitHub Pages versions. It builds page navigation and loads Mermaid only for pages containing diagrams.

## Theme and calculator

The active `assets/js/calculators.js` includes the function support from `calculators_plus.js`. Load only the active script; the supplied plus file is retained as a reference and must not be loaded alongside it because their global declarations overlap.

Expressions support `sin`, `cos`, `tan`, `arcsin`/`asin`, `arccos`/`acos`, `arctan`/`atan`, and `ln` (natural logarithm). Trigonometric arguments and inverse-trigonometric results use radians. Functions require parentheses and one argument; write multiplication explicitly, for example `2*sin(x)`. Invalid domains, division by zero, and non-finite intermediate results produce an error message.

Powers bind more tightly than a leading sign and associate to the right: `-2^2 = -4`, `(-2)^2 = 4`, `2^-3 = 0.125`, and `2^3^2 = 512`. Signed variables and function calls work in products, for example `2*-x` and `2*-sin(x)`. Existing titles, input descriptions, pending notices, and result formatting are preserved.

The active layout, stylesheet, and calculator were copied from `Webpage_package`. The active stylesheet adds responsive navigation, image sizing, and horizontal scrolling for wide tables and equations. The package remains as the supplied reference.

The calculator script creates a form for each `data-calculator` element. The boxed equations have reviewed definitions in `tools/boxed_calculators.json`, including English input descriptions. The three unspecified expressions requested by the owner are no longer boxed and have no calculator. The relativistic-mass formula and the reviewed formulas have been corrected, with matching calculator definitions and notes. See `tools/formula-review.md` for scope, conventions, and references. There are currently 153 boxed definitions and 154 active calculators, with no pending notices. Usage examples remain in `Webpage_package/README.md`.

Run `python tools/add_boxed_calculators.py` to add missing markers. It scans all Markdown outside generated/tool directories, refuses unconfigured boxes, and does not duplicate existing markers. To revise an existing calculator, update both its Markdown marker and the matching JSON definition. Run `node tools/check_calculators.cjs` to validate coverage, inputs, numerical examples, and error handling.

Calculators use consistent SI input units unless the local note specifies otherwise. `pi` and `e` are built-in per-widget constants; physical constants such as `g` and `R` remain editable inputs. Equivalent chained equations use the equality identified by the calculator inputs or note. The speed/velocity box has separate forms for both quantities.
