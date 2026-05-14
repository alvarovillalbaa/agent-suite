---
name: compile-raw
description: Process all unprocessed files in the raw/ folder and compile them into canonical knowledge base pages. Handles mixed source types — markdown, PDFs, YouTube transcripts, Twitter exports, web captures, and more.
argument-hint: "[optional: path to specific raw/ subfolder or single file]"
allowed-tools: [Read, Write, Bash, Glob, AskUserQuestion, Skill]
---

Use skill: **second-brain** — `skills/second-brain/SKILL.md`.
Also read:
- `skills/second-brain/references/ingest_sources.md` — per-source extraction instructions
- `skills/second-brain/references/wiki_compiler.md` — absorb, cleanup, rebuild, and reorganize loops
- `skills/second-brain/references/operational_modes.md` — ingest mode contract

## Steps

### 1. Discover

List every file in `raw/` (or the specified path) where `status` is not `processed`. Group by source type:

```sh
grep -rL "status: processed" raw/ 2>/dev/null
```

Report the count and breakdown before starting (e.g., "12 files — 3 twitter, 4 web, 2 pdf, 3 markdown").

If the queue is large (>20 files), ask the user whether to run all at once or process in priority order per `references/ingest_sources.md`.

### 2. Extract

For each file:
- `source: twitter` or `.md` tweets → already text, proceed to absorb.
- `source: youtube` or `.srt` / `.vtt` → strip timestamps: `sed '/^[0-9]/d;/^$/d;s/<[^>]*>//g'`.
- `source: pdf` or `.pdf` → run `pdftotext <file> -` and append the text to the raw entry.
- `source: linkedin` or `source: web` → already markdown from defuddle, proceed to absorb.
- `.json` → parse relevant fields and flatten to markdown.
- `.csv` → convert rows to markdown list or table.
- `.png` / `.jpg` → run `tesseract` OCR if available, otherwise describe the image and note it needs manual extraction.

### 3. Orient

Before writing anything:
- Read `BRAIN.md` to confirm the brain's folder structure and retention rule.
- Read `knowledge/INDEX.md` or the equivalent index.
- Identify which canonical pages are likely to need updates based on the source content.

### 4. Absorb (per-file loop)

For each extracted source:

1. Extract entities, concepts, claims, decisions, procedures, open questions, and dates.
2. Search for existing canonical pages that should absorb the new information.
3. Update canonical pages — rewrite the current-state or compiled-truth section, append evidence to the timeline section.
4. Create new pages only when the source introduces a durable topic with enough substance to warrant it.
5. Record contradictions, supersessions, or strengthened consensus explicitly.
6. Mark the raw file as `status: processed` after successful absorption.

Use a checkpoint every 10 files: rebuild the index, inspect the most-edited pages as whole documents, and split any page that has become a dumping ground.

### 5. Rebuild

After the full pass:

- Refresh `knowledge/INDEX.md`.
- Append a summary entry to `logs/YYYY-MM-DD.md`:
  ```
  compile-raw: N files processed, M pages created, P pages updated
  ```
- Update any synthesis or hub pages that are now stale.

### 6. Report

Deliver:
- Count of files processed.
- Canonical pages created (list with paths).
- Canonical pages updated (list with paths).
- Contradictions found and how they were handled.
- Open threads that need human judgment.
- Files that could not be extracted (reason noted).
- Suggested next actions (synthesis sweeps, gap pages, health check).
