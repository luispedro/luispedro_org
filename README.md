# [luispedro.org](https://luispedro.org)

[![Netlify Status](https://api.netlify.com/api/v1/badges/5fcbc8b8-bcf5-47c2-bd34-a52872edb9c6/deploy-status)](https://app.netlify.com/sites/luispedro/deploys)

Source for my personal website: a static site built with
[elm-pages](https://elm-pages.com/) v2 and deployed on
[Netlify](https://www.netlify.com/).

## Getting started

Requires [Node.js](https://nodejs.org/) (npm). The Elm toolchain itself
(`elm`, `elm-format`) is installed automatically by
[elm-tooling](https://elm-tooling.github.io/elm-tooling-cli/) via the
`postinstall` hook, so there is nothing to install by hand.

```bash
npm install        # also installs elm + elm-format via elm-tooling
npm start          # dev server with hot reload at http://localhost:1234
npm run build      # production build → dist/
```

There is no test suite.

## Repository layout

```
content/        Markdown pages (most of the site)
papers.yaml     Publication list
public/         Static assets served as-is (images, files, vita.pdf, style.css)
src/            Elm source
_redirects      Netlify redirects for old URLs
netlify.toml    Build configuration
```

## Where the content lives

Pages come from two places:

**1. Markdown in `content/`.** Everything under `content/` is globbed at build
time by `SiteMarkdown.mdFiles` and served through the catch-all route
`src/Page/SPLAT__.elm`. The path mirrors the filename, so
`content/software/jug.md` becomes `/software/jug`, and `content/software/index.md`
becomes `/software`. Each file needs YAML front matter with at least a `title`:

```markdown
---
title: Page title
---

Body text in Markdown.
```

Note that only `.md` files are picked up — a `.rst` file in `content/` is
silently ignored and its URL will 404.

**2. Elm in `src/Page/`.** A few pages are written directly in Elm:

- `src/Page/Index.elm` — the front page. The short bio and the "Upcoming
  Travels & Talks" list are inline strings here, *not* in `content/`.
- `src/Page/Publications.elm` — renders `papers.yaml`.
- `src/Page/SPLAT__.elm` — the catch-all that serves `content/`.

Supporting modules: `src/Shared.elm` (site-wide layout, navbar, analytics),
`src/SiteMarkdown.elm` (Markdown rendering), `src/Publications.elm` (YAML
decoding and citation formatting), `src/Site.elm` (canonical URL, manifest).

Upcoming events appear in **two** places that must be kept in sync:
`content/travel.md` and the front-page section in `src/Page/Index.elm`.

## Adding a publication

Publications live in `papers.yaml` as a single YAML list. To add one:

```bash
python add-paper-stub.py <DOI>   # needs `requests` and `pyyaml`
```

This fetches metadata from [CrossRef](https://www.crossref.org/) and writes a
stub to `PAPER_OUT.md`. Check it by hand (journal names and author lists from
CrossRef are often imperfect), then paste the entry into `papers.yaml`.

Fields of note: `isFirstLast: true` marks papers where I am first or last
author, which the site highlights; it is set automatically by the script but
worth verifying. An optional `comment` field renders a note below the citation.

`print-pubs.py` dumps the whole list as numbered Markdown citations, which is
handy for grant applications and CVs.

## Deployment

Pushing to `main` triggers a Netlify build and deploys to the live site. The
build command lives in `netlify.toml`; `_redirects` maps old URLs to their
current locations.
