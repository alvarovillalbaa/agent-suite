---
name: ingest
description: Ingest any source into the second brain raw/ layer and optionally compile it into canonical knowledge. Supports Twitter/X (xurl), web URLs, YouTube, LinkedIn, PDFs, and local files.
argument-hint: "[URL, tweet ID, file path, or paste raw text]"
allowed-tools: [Read, Write, Bash, WebFetch, AskUserQuestion, Skill]
---

Use skill: **second-brain** — `skills/second-brain/SKILL.md`.
Also read: `skills/second-brain/references/ingest_sources.md` for source-specific fetch and parse instructions.

## Steps

1. **Classify the source**

   Detect what was provided:
   - Twitter/X URL or tweet ID → use `xurl` per the ingest_sources playbook
   - YouTube URL → use `yt-dlp --skip-download --write-auto-sub`
   - LinkedIn URL → use `defuddle` or `agent-browser`
   - Any other web URL → use `defuddle parse <URL> --md`
   - Local file path (`.pdf`, `.md`, `.txt`, `.srt`) → read directly, run `pdftotext` if PDF
   - Pasted raw text → save directly to `raw/`

2. **Fetch or extract the content**

   Use the appropriate tool from `references/ingest_sources.md`. If the tool is unavailable, fall back to the next option in that section and note the fallback used.

3. **Save to raw/**

   Write the result to `raw/YYYY-MM-DD_<source-type>_<slug>.md` with the standard frontmatter:
   ```
   source: <type>
   url: <original URL or ID>
   fetched: YYYY-MM-DD
   status: unprocessed
   ```

4. **Immediate compile (optional)**

   If the user wants the content compiled now rather than queued:
   - Read `BRAIN.md` to learn the brain's structure.
   - Run the ingest mode from `references/operational_modes.md`.
   - Update relevant canonical pages under `knowledge/`.
   - Refresh `INDEX.md` and the current dated log in `logs/`.
   - Mark the raw file as `status: processed`.

5. **Report**

   Tell the user:
   - What was fetched and from where.
   - Where the raw file was saved.
   - If compiled: which canonical pages were created or updated and what contradictions or open threads were found.
   - If queued: confirm the file is ready for the next `compile-raw` pass.
