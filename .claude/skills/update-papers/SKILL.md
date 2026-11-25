---
name: update-papers
description: Add papers or preprints to the luispedro.org publication list, given one or more DOIs. Runs add-paper-stub.py, cleans up its output in papers.yaml (journal names, authors, dates, order, replacing a preprint by its published version), announces each paper in the news feed (Index.elm and news.md), and refreshes the Google Scholar / Web of Science citation counts on the /publications page. Use when asked to add a paper, update the papers list, or update citation counts.
argument-hint: <DOI> [<DOI> ...]
---

# Add papers and refresh citation counts

Input: one or more DOIs from the user (`$ARGUMENTS`). Do not go looking for
other new papers. If no DOI is given, only do the citation refresh (step 4).

Run everything from the repository root.

## 1. Add each DOI and clean up the entry

```bash
python add-paper-stub.py <DOI>
```

This appends a CrossRef-derived entry to the end of `papers.yaml`. Clean it up:

- **Title**: strip HTML/JATS tags (`<i>`, `<scp>`, `<sub>`, ...), collapse
  whitespace and line breaks, remove surrounding quotes CrossRef sometimes adds.
- **Authors**: complete list in the right order; no doubled spaces; fix
  all-caps or mangled names. If CrossRef gave no authors (the script warns),
  get them from the publisher page.
- **Journal**: proper title case, spelled the same way as existing entries
  (`grep '^  Journal:' papers.yaml | sort | uniq -c`). E.g. `Nature Microbiology`,
  `PLOS ONE`, `Nucleic Acids Research`. Preprints use `bioRxiv (PREPRINT)` /
  `medRxiv (PREPRINT)`. If the script printed `Could not parse journal`, fill
  it in.
- **Date**: quoted `'YYYY-MM-DD'`, matching `Year`. The script prefers
  `published-print`, but the site uses the **online publication date** (see
  commit c5dbe0a). Check `published-online` in CrossRef
  (`curl -s https://api.crossref.org/works/<DOI> | python -c "import json,sys; m=json.load(sys.stdin)['message']; print({k: m[k]['date-parts'] for k in ('published-online','published-print','published') if k in m})"`)
  and use it when available. CrossRef often has only the print issue date
  (e.g. the Cell osteopontin paper: CrossRef says 2026-10, but it was online
  on 2026-08-04). In that case get the online date from the publisher's page
  (`https://doi.org/<DOI>`), or ask the user. Never leave a made-up `-01` day
  without saying so.
- **isFirstLast**: `true` only if Luis is first or last author (shared
  first/last authorship counts). The script guesses this from the author
  list; check it.
- **Order**: move the entry so `papers.yaml` stays in **ascending date order**.
- **Published preprint**: if a preprint of this paper is already in
  `papers.yaml` (search for distinctive title words), delete the preprint
  entry: the published version replaces it (see commit 2024ba0).
- Drop fields left empty or obviously wrong; keep the key order the script
  emits (`Title, Authors, Journal, Doi, Year, Date, isFirstLast`).

Check that it still parses:

```bash
python -c "import yaml; d=yaml.safe_load(open('papers.yaml')); print(len(d), 'entries')"
```

## 2. Announce in the news feed

For each new paper/preprint, add a line to **both**
`src/Page/Index.elm` (`# Past News & Travels` section) and `content/news.md`,
under the right `## YYYY` heading, in **descending** date order within the
year, with the same date as the `Date` in `papers.yaml`:

```
**Aug 1** Our paper [Title](https://doi.org/DOI) is published in *Journal*.
**May 12** Our preprint [Title](https://doi.org/DOI) is posted on bioRxiv.
```

Use `Our review` for reviews. When a preprint has now been published, add a
new "is published in" line and leave the earlier preprint announcement. If
the date puts the item into a year heading that does not exist yet, create
it. The two files must end up with identical lines for these items.

## 3. Leave Selected Publications alone

The "Selected Publications" list in `src/Page/Publications.elm` is curated by
hand. Do not edit it unless asked; you may mention a new first/last-author
paper as a candidate.

## 4. Refresh citation counts

The counts are in the `intro` of `src/Page/Publications.elm`:

```
Updated: **26 Aug 2026**
...
Google Scholar total citations: 27,297; h-index: 55 ([Web of
science](https://www.webofscience.com/wos/author/record/1798261):
16,905 citations; h-index: 48)
```

**Google Scholar**: a plain fetch works:

```bash
curl -s -A "Mozilla/5.0 (X11; Linux x86_64)" \
  "https://scholar.google.com/citations?user=qTYua0cAAAAJ&hl=en" \
  | grep -o 'gsc_rsb_std">[0-9]*' | head -3
```

The three numbers are: all-time citations, citations since 5 years ago, and
all-time h-index. Use the 1st and 3rd. If the output is empty (CAPTCHA or
rate limit), ask the user for the numbers.

**Web of Science**: the numbers are not in the page's HTML, and the free view
of the author record does not show them to automated browsing either. Ask
the user for the WoS citation count and h-index. If they don't have them to
hand, keep the old WoS numbers and say so.

Write the numbers with thousands separators (`28,899`) and set `Updated:`
to today's date, written `D Mon YYYY`. Citation counts should not go down;
if one does, double-check it before writing it.

## 5. Build, commit, report

```bash
npm run build
```

The build must pass (it fails on a missing `Date`, bad YAML, or an Elm
error). Commit in the house style:

```
ENH Add <short name> paper; update citations
```

(`MIN Update citation counts` if only the counts changed.) **Do not
`git push`**: pushing `main` deploys the live site. Tell the user what was
added or replaced, what you changed in the stub's output, and the old → new
citation numbers.
