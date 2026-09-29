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

The active layout, stylesheet, and calculator were copied from `Webpage_package`. The active stylesheet adds responsive navigation, image sizing, and horizontal scrolling for wide tables and equations. The package remains as the supplied reference.

The calculator script is included by the layout but creates no interface unless a page contains a `data-calculator` element. No calculator widgets were added to the study notes. Usage examples remain in `Webpage_package/README.md`.
