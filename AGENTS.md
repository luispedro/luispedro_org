# Agents

This file provides guidance to agents when working with code in this repository.

## Commands

```bash
npm start          # dev server (hot reload) at localhost:1234
npm run build      # production build → dist/
```

No test suite exists for this project.

## Git workflow

Commit changes freely, but **do not `git push` unless explicitly asked**. Pushing to `main` triggers a Netlify deployment to the live site.

## Architecture

This is a personal website ([luispedro.org](https://luispedro.org)) built with **elm-pages v2** and deployed on Netlify.

### Two sources of content

**1. Markdown files in `content/`** — Most pages on the site. They are served by the catch-all route `src/Page/SPLAT__.elm`, which globs all `.md` files at build time using `SiteMarkdown.mdFiles`. Each file has YAML front matter with at minimum a `title` field.

**2. Elm source in `src/Page/`** — A few pages are coded directly in Elm:
- `src/Page/Index.elm` — The front page. The "Upcoming Travels & Talks" section and the short bio blurb live here as inline strings, **not** in `content/`. When updating upcoming events, edit this file.
- `src/Page/Publications.elm` — Reads `papers.yaml` and renders the full publication list.

### Publications workflow

Publications are stored in `papers.yaml` (one YAML list). To add a new paper:
1. Run `python add-paper-stub.py <DOI>` — fetches metadata from CrossRef and writes a stub to `PAPER_OUT.md`
2. Manually verify the output, then paste the entry into `papers.yaml`

The `Publications.elm` module decodes the YAML and highlights papers where Luis is first or last author (`isFirstLast: true`). An optional `comment` field renders a note below the citation.

### Key modules

- `src/SiteMarkdown.elm` — Markdown rendering helpers (`mdFiles` glob, `mdToHtml`, `mdToInlineHtml`).
- `src/Shared.elm` — Site-wide layout (navbar, Bootstrap CDN, analytics).
- `src/Publications.elm` — YAML decoder and HTML rendering for publications.

### Content vs. front-page travel section

There are **two** travel-related files that must be kept in sync:
- `content/travel.md` — The `/travel` page (upcoming events archive).
- `src/Page/Index.elm` (around line 111) — The "Upcoming Travels & Talks" section on the front page.

When adding or removing events, update **both**.
