# Operational Modes

Use this reference when the user asks for a concrete second-brain action rather than a broad architecture discussion.

These modes are storage-agnostic. They describe the workflow contract, not a required UI, slash command, or Obsidian feature.

## Shared rules

Apply these rules across all modes:

- read the operating manual first when it exists
- use `INDEX.md`, hub pages, or the user's equivalent before broad searching
- search before creating so the system does not grow duplicate pages
- preserve raw sources when durable ingestion is wanted
- propagate meaningful changes to indexes, logs, boards, daily notes, and output registries
- report what was created, what was rewritten, what contradictions were found, and what still needs judgment

## Bootstrap or init mode

Use when the user wants to initialize, bootstrap, or align an existing corpus.

Default flow:

1. Map the current structure.
2. Inspect representative notes, templates, dashboards, boards, or instruction files.
3. Create or refresh the operating manual, `INDEX.md`, and `LOG.md` or their equivalents.
4. Preserve existing naming, metadata, and folder conventions when they already work.
5. If an operating manual already exists, diff mentally and avoid overwriting it without approval.

Goal: produce a usable navigation and maintenance layer without forcing a migration.

## Save or session-capture mode

Use when the user says things like:

- save this conversation
- capture this meeting
- file this session
- update the second brain with what we just decided

Default flow:

1. Scan the conversation for decisions, tasks, people, projects, ideas, procedures, insights, and notable quotes.
2. Group updates by note type so related writes can happen coherently and in parallel when helpful.
3. Search for the existing canonical page for each durable item before creating anything new.
4. Update or create the relevant canonical pages.
5. Propagate links to the daily note, boards, project pages, and `LOG.md`.
6. Report where everything landed.

Goal: no orphan dump note, no duplicated entity page, no lost decision.

## Ingest mode

Use when the user provides a URL, file, pasted text, screenshot, transcript, PDF, audio, or another source and wants it absorbed into the knowledge base.

Default flow:

1. Classify the source type before processing it deeply.
2. Preserve the source in the raw layer when durable ingestion is wanted.
3. Extract entities, concepts, claims, decisions, procedures, tasks, dates, and quotes.
4. Update the relevant canonical pages by rewriting current-state sections, not just appending.
5. Create or refresh source-summary pages only when they add retrieval value.
6. Record contradictions, supersessions, and strengthened consensus explicitly.
7. Refresh `INDEX.md`, `LOG.md`, and any synthesis pages touched by the source.
8. Update today's note or another current-state log if the user keeps one.

If an ingest only creates new pages and rewrites nothing, it was probably too shallow.

## Daily refresh mode

Use when the user wants today's note, a session note, or a current-state refresh.

Default flow:

1. Create or update today's daily note or the user's equivalent.
2. Pull in due or overdue tasks from boards or operational pages.
3. Add calendar context only if a calendar integration exists and the user wants it.
4. Summarize overnight or recent changes from `LOG.md`, synthesis pages, or maintenance runs.
5. Seed the note with current work from the conversation when relevant.

Goal: the user can open one page and know what matters today.

## World or context-restore mode

Use when the user wants continuity, a boot-up sequence, or a fast context restore.

Load progressively:

- `L0`: `CRITICAL_FACTS.md`, `PINNED.md`, and identity/preferences
- `L1`: `INDEX.md` and recent `LOG.md`
- `L2`: current-state files, today's note, recent daily logs, active boards, active projects
- `L3`: deep project pages or raw sources only when the current task needs them

If the task is long-running and expensive to reload, maintain a short `PINNED.md` with only the facts that must survive context loss.

## Synthesize or emerge mode

Use when the user wants patterns, themes, or cross-source insight rather than local cleanup.

Look for:

- recurring concepts across unrelated recent sources
- people or entities that repeatedly co-occur without an explicit relationship page
- concepts that have evolved through repeated updates
- orphan pages that contain useful ideas but weak link structure
- recurring blockers, energy drains, or strategic themes in recent notes

Outputs can include:

- synthesis pages
- pattern reports
- connection pages
- refreshed hub pages
- short summaries in the daily note or log

Goal: surface what the user has not named yet.

## Reconcile mode

Use when the user wants contradictions resolved or stale knowledge refreshed.

Default flow:

1. Find conflicting claims, reversed decisions, stale entity descriptions, and pages lagging behind newer evidence.
2. Judge each conflict by recency, authority, and whether it is a contradiction or a genuine evolution.
3. Rewrite current-state sections to reflect the best current understanding.
4. Preserve the older state in history, timeline, or evidence sections.
5. If the conflict is genuinely ambiguous, create or update an explicit conflict page or open-thread section instead of pretending it is solved.

Goal: the system should never disagree with itself silently.

## Health or audit mode

Use when the user says health check, audit, lint, cleanup, or gap review.

Check for:

- contradictions
- broken or weak links
- duplicates
- stale claims
- concept gaps
- orphan pages
- missing metadata or repeated-structure defects
- unsupported claims with no raw/source backing
- drift between recurring outputs and the canonical wiki

Group findings by severity and distinguish safe fixes from destructive ones.

## Challenge mode

Use when the user wants their current idea, plan, or assumption pressure-tested against their own history.

Search for:

- prior failures
- reversed decisions
- recorded doubts
- contradictory notes
- similar attempts that ended badly or differently

Output:

- restated position
- counter-evidence with citations
- blind spots
- verdict or caution level

Goal: use the knowledge base as a red team, not a cheerleader.

## Connect mode

Use when the user wants two domains bridged for creativity or transfer learning.

Default flow:

1. Gather the local clusters around both domains.
2. Trace explicit graph paths if they exist.
3. If not, look for structural analogies, shared people, shared patterns, or semantic overlap.
4. Produce a few concrete, actionable bridges rather than vague metaphors.

Goal: create useful creative friction.

## Graduate mode

Use when the user wants an idea turned into an execution artifact.

Default flow:

1. Find the source idea note or fragment.
2. Read linked context, related projects, people, and past decisions.
3. Create or update a project page, plan, or procedure page.
4. Add tasks or board entries if the user tracks work operationally.
5. Mark the idea as graduated while preserving it as the origin point.

Goal: the idea evolves into a plan without losing its provenance.

## Export mode

Use when the user wants the knowledge base exposed to another tool, agent, or review process.

Useful export shapes:

- flat JSON snapshot
- markdown catalog
- compact graph or adjacency list
- filtered export by topic, type, date range, or project

Typical fields:

- path
- title
- type
- summary
- tags
- status
- outgoing links
- incoming links when available
- source references or provenance fields

Goal: make the knowledge base legible outside its native frontend.

## Visualize mode

Use when the user wants a graph, atlas, canvas, or map of the knowledge base.

Storage-agnostic outputs can include:

- `.canvas` for Obsidian users
- Mermaid graphs
- JSON graph exports
- markdown summaries of hubs, clusters, bridges, and orphans

Good defaults:

- center hub nodes
- cluster by page type
- highlight orphans
- show bridge nodes between otherwise separate clusters

Goal: make structure visible without turning the visual layer into the source of truth.

## Automation mode

Use when the user wants background maintenance or scheduled runs.

Common schedules:

- morning: daily refresh and due-work pull
- nightly: consolidation, reconcile, synthesize, orphan rescue, index refresh
- weekly: review and recap
- periodic health: audit links, stale claims, and coverage gaps

Rules:

- keep the workflow the same whether it runs manually or on a schedule
- keep secrets out of tracked files
- prefer platform-native schedulers or repo-local scripts that the user can inspect
- require approval for destructive cleanup or ambiguous contradiction resolution
