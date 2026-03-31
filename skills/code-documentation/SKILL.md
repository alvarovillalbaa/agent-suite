---
name: code-documentation
description: This skill should be used when the user asks to "write documentation", "document this", "add a README", "create a changelog", "write a daily log", "document this service", "write an ADR", "create a technical report", "add JSDoc", "add docstrings", "document this API", "write a post-mortem", "create architecture docs", "update the docs", "write a migration guide", "document this decision", "create a service overview", "write a TESTS.md", "update documentation for my changes", "check docs for this PR", "what docs need updating", "sync docs with code", "scaffold docs for this feature", "review docs completeness", "add docs for this change", "what documentation is affected", "docs impact", or asks how to document any code, service, feature, or architectural decision. Also use when working with MDX files, docs/01-app, docs/02-pages directories, .mdx files, or reviewing PRs for documentation completeness. Covers both continuous documentation (daily logs, changelogs, API docs) and one-off documentation (reports, ADRs, post-mortems, migration guides) for any tech stack, including Next.js MDX-based documentation.
version: 1.0.0
---

# Code Documentation

Produce documentation that is discovered, read, and trusted over time. Every documentation task falls into one of two modes: **continuous** (routine, append-only, low friction) or **one-off** (deliberate, structured, time-bounded).

## Philosophy

Documentation exists to reduce future cognitive load — for the next engineer, the next agent, or the future self. Prioritize:

1. **Proximity** — docs live as close to the code as possible
2. **Brevity** — say what happened and why; skip what and how (the code shows that)
3. **Freshness** — outdated docs are worse than no docs
4. **Audience fit** — write for the next reader, not the current author
5. **Discoverability** — a doc no one finds is not a doc

## Documentation Taxonomy

Two axes govern every documentation decision:

**Axis 1: Longevity**
- **Continuous** — logs, changelogs, inline docs, API docs (ongoing maintenance)
- **One-off** — reports, ADRs, post-mortems, migration guides (created once)

**Axis 2: Placement**
- **Inline** — docstrings, comments, type annotations (lives in code)
- **Service-level** — README, ARCHITECTURE, TESTS.md (lives in the service directory)
- **Project-level** — `memories/`, `audits/`, `plans/`, `specs/`, `cookbook/` (lives in `docs/`)
- **External** — wikis, Notion, Confluence (lives outside the repo)

## Quick Decision Guide

| Task | Type | Location |
|------|------|----------|
| What changed today | Memory | `docs/memories/logs/YYYY/MM-DD/*.md` |
| Lesson learned from work | Memory | `docs/memories/lessons/YYYY/MM-DD/*.md` |
| Facts from user/company context | Memory | `docs/memories/facts/YYYY/MM-DD/*.md` |
| How things should be done | Memory | `docs/memories/procedures/YYYY/MM-DD/*.md` |
| Error solution discovered | Memory | `docs/memories/fixes/YYYY/MM-DD/*.md` |
| Navigate a directory / orient a reader | In-folder | `README.md` in that directory |
| Internal design of a directory | In-folder | `ARCHITECTURE.md` in that directory |
| Version history of a service/package | In-folder | `CHANGELOG.md` at service root |
| What this service does | Service-level | `services/name/README.md` |
| Why this architecture decision | One-off | `docs/audits/YYYY/MM-DD/adr-name.md` |
| API endpoint behavior | Inline + schema | docstrings + OpenAPI/schema file |
| Incident post-mortem | One-off | `docs/audits/YYYY/MM-DD/post-mortem.md` |
| Migration steps | One-off | `docs/plans/YYYY/MM-DD/migration-name.md` |
| Feature spec | Project-level | `docs/specs/YYYY/MM-DD/spec-name.md` |
| Implementation plan | Project-level | `docs/plans/YYYY/MM-DD/plan-name.md` |
| Complex function explanation | Inline | comment above function |
| Component props/usage | Inline | JSDoc / TSDoc / Storybook |
| Component, hook, or route contract | Inline + local feature doc | TSDoc plus nearby README or feature doc when behavior spans files |
| Testing patterns | In-folder / service-level | `TESTS.md` in the relevant directory |
| Investigation findings | One-off | `docs/audits/YYYY/MM-DD/report-name.md` |
| How-to guide | Project-level | `docs/cookbook/guide-name.md` |

---

## Continuous Documentation

### Development Logs (`docs/memories/logs/`)

Development logs are the single most important continuous documentation habit. Write them after every meaningful change — new features, bug fixes, refactors, config changes.

**Rules (non-negotiable):**
- Append to the **latest existing date file** — never create new files
- **2 lines max** per change
- Format: **what happened + why** (not how — the code shows that)
- Past tense, active voice

**Finding the latest file:**
```bash
# Year folder, then MM-DD subfolder: docs/memories/logs/YYYY/MM-DD/
ls docs/memories/logs/ | sort | tail -1  # → latest year
# Or use the helper script: skills/code-documentation/scripts/find-docs.sh
```

**Format:**
```
- Fixed OAuth token refresh by adding missing redirect URI — was causing silent login failures on mobile
- Refactored candidate serializer to use RetrievalLevelMixin — removed ad-hoc to_representation override
```

### Memory Documentation (`docs/memories/`)

The `memories/` folder is the team's collective knowledge base — accumulated wisdom from working in this codebase. All memory artifacts use `docs/memories/<type>/YYYY/MM-DD/*.md`.

**Lessons** (`docs/memories/lessons/`) — Reusable insights from code experience. Write when a discovery should change future behavior and can't be derived from reading the code alone. Gate: verified by real work, non-trivial, reusable.

**Facts** (`docs/memories/facts/`) — Stable facts about the user, company, or project context not derivable from code. Write when a teammate would make wrong assumptions without it. Gate: durable, non-sensitive, clearly true.

**Procedures** (`docs/memories/procedures/`) — Documented workflows that would require rediscovery without notes. Write after discovering or refining how something should be done. Gate: repeatable, non-trivial to rediscover, tested at least once.

**Fixes** (`docs/memories/fixes/`) — Solutions to errors or bugs that recurred or were non-obvious. Write when a fix is specific, reproducible, and likely to be needed again. Gate: non-obvious, fix is reproducible.

See `references/continuous-docs.md` for detailed format guidance on each artifact type.

### Changelogs (`CHANGELOG.md` at service/package root)

Two audiences, two files. **Customer-facing** changelogs live in `CHANGELOG.md` at the service or package root — plain language, user-benefit focused, written after release. **Internal engineering** notes live in the release PR description or `docs/audits/YYYY/MM-DD/release-notes.md` — technical details, breaking changes, migration steps.

See `references/continuous-docs.md` for format, structure, and anti-patterns.

### Inline Documentation

Inline docs are the highest signal-to-noise documentation — they live next to the code they describe.

**Docstrings**: Required on all public functions, methods, classes, and modules. Include: purpose, params, return value, raised exceptions, and any non-obvious side effects.

**Comments**: Only where logic isn't self-evident. Explain *why*, never *what*.

**Type annotations**: Use throughout all code. They are documentation.

**Anti-patterns:**
- Comments that restate the code (`# increment counter`)
- Outdated comments that no longer match the code
- Missing docstrings on public APIs
- Over-documenting private implementation details

---

## One-Off Documentation

### Technical Reports / Audits

Use for: architecture audits, investigation findings, performance analyses, security reviews.

Structure: `summary → context → findings → evidence → recommendations`

Location: `docs/audits/YYYY/MM-DD/report-name.md`

### Architecture Decision Records (ADRs)

Use for: decisions with non-obvious trade-offs that future engineers will question.

Format: `context → decision → consequences → alternatives considered`

Write an ADR when: the decision is irreversible or expensive to reverse, the trade-offs are non-obvious, or the decision contradicts a common pattern for good reason.

Location: inline in service README *or* `docs/audits/YYYY/MM-DD/adr-name.md`

### Post-Mortems

Use for: any production incident or significant bug causing user impact.

Structure: `impact → timeline → root cause → contributing factors → action items`

Tone: blameless, factual, forward-looking. Never assign individual blame.

Location: `docs/audits/YYYY/MM-DD/post-mortem-incident-name.md`

### Migration Guides

Use for: schema changes, API breaking changes, service restructuring.

Structure: `motivation → before/after state → step-by-step → rollback plan → verification`

Location: `docs/plans/YYYY/MM-DD/migration-name.md`

### Specs (`docs/specs/`)

Use for: feature requirements, API contracts, and behavior specifications before implementation.

Structure: `problem statement → requirements → acceptance criteria → out of scope`

Write a spec first, then an implementation plan in `docs/plans/`, then implement. The spec is the contract; the plan is the execution strategy.

Location: `docs/specs/YYYY/MM-DD/spec-name.md`

---

## Updating Docs for Code Changes

When code changes on a branch, documentation often needs to follow. Use this workflow to identify and update affected docs systematically — useful for PR reviews, feature work, and post-refactor sweeps.

### Quick Workflow

1. **Analyze changes** — `git diff <base>...HEAD --stat` to see changed files
2. **Identify affected docs** — map changed source files to documentation paths
3. **Review and update** — walk through each doc change, confirm with user before editing
4. **Validate** — run lint/format checks before committing
5. **Commit** — stage documentation changes separately from code

### Step 1: Get the Diff

```bash
# See all changed files on this branch
git diff main...HEAD --stat

# See changes in a specific area
git diff main...HEAD -- src/
```

### Step 2: Identify Documentation-Relevant Changes

Focus on changes that affect public contracts:
- New or changed function signatures, component props, or config options
- New features, behaviors, or breaking changes
- Deprecated features requiring migration guidance
- New file types, conventions, or CLI commands

For Next.js projects, use `references/nextjs-code-to-docs-mapping.md` to find corresponding documentation files.

General mapping heuristics:

| Code Change | Documentation Impact |
|-------------|---------------------|
| New/changed component props | Component API reference |
| Config option added/changed | Configuration reference |
| New feature or behavior | Guide or concept doc |
| Breaking change | Migration guide + CHANGELOG |
| Deprecated feature | Deprecation notice + migration path |
| Internal utility only | Usually no docs needed |

### Step 3: Apply Updates with Confirmation

For each documentation change:
1. Show the user what you plan to change
2. Wait for confirmation before editing
3. Apply the edit
4. Move to the next change

### Step 4: Validate Before Committing

Run linting and formatting checks before staging docs:

```bash
# For Next.js documentation
pnpm lint
pnpm prettier-fix
```

---

## In-Folder Documentation

Any directory with substantial content can carry its own documentation files. These files orient readers to the directory — what lives there, how it's organized, and how to navigate it. They apply at every level: repo root, `docs/`, `docs/memories/`, `services/`, `services/auth/`, `services/auth/handlers/`, and so on.

| File | Purpose | Create when |
|------|---------|-------------|
| `README.md` | Overview and navigation — what's here and how to use it | Any directory a reader might enter without context |
| `ARCHITECTURE.md` | Technical deep-dive — how it works, data flows, design decisions | Any directory with non-obvious internal structure |
| `OVERVIEW.md` | High-level concepts — mental model before diving into code | Complex domains where concepts precede details |
| `TESTS.md` | Testing patterns, how to run, what's covered | Any directory with a test suite |
| `SETUP.md` | Config, install, environment — non-obvious setup steps | When `install` alone isn't enough to get running |
| `CHANGELOG.md` | Version history — what changed between releases | Versioned services, libraries, or packages |
| `FAQ.md` | Common questions and troubleshooting | After 3+ repeated questions about the same directory |

**`README.md` is the most important.** It's the entry point for anyone exploring a directory. Always create one when the directory has more than a handful of files or when the contents aren't self-evident from filenames.

**Depth guidance:**
- **Root-level directories** (`docs/`, `services/`, `src/`) — always have a `README.md`
- **Sub-directories** (`docs/memories/`, `services/auth/`) — add `README.md` when the subdirectory has its own structure or purpose that isn't obvious from the parent
- **Leaf directories** (`docs/memories/logs/2026/03-21/`) — no in-folder docs needed; the content files themselves are the documentation
- **`docs/` subdirectories** (`docs/memories/`, `docs/audits/`, `docs/cookbook/`) — each should have a `README.md` that explains what kind of content lives there and how to navigate it

---

## Service Documentation

Every service or module directory should have, at minimum:

```
services/service-name/
├── README.md         # What it does, when to use it, key concepts
├── ARCHITECTURE.md   # How it works internally, data flows, design decisions
└── TESTS.md          # Testing patterns, how to run, what's covered
```

Sub-directories within the service can carry their own docs at each level:

```
services/service-name/
├── README.md
├── ARCHITECTURE.md
├── TESTS.md
├── handlers/
│   └── README.md     # What the handlers sub-module does
├── models/
│   └── README.md     # Data model overview for this service
└── migrations/
    └── README.md     # Migration history and conventions
```

Additional service-level files as needed:
- `SETUP.md` — non-obvious configuration or initialization
- `OVERVIEW.md` — high-level conceptual overview for newcomers
- `CHANGELOG.md` — version history (if the service has versioned releases)
- `FAQ.md` — common questions, troubleshooting, gotchas

**README minimum requirements:**
1. One-sentence description of the service's purpose
2. When to use it vs. alternatives (what it's NOT)
3. Key concepts (2–5 bullets)
4. Quick start or usage example
5. Links to ARCHITECTURE.md and TESTS.md

---

## API Documentation

**Backend (REST/Django/FastAPI/Express):**
- Docstrings on all view classes, endpoint functions, and serializers
- Document request body shape, auth requirements, query params, and error codes
- OpenAPI/Swagger annotations where the framework supports them

**Frontend (JS/TS):**
- JSDoc/TSDoc on all exported functions, hooks, and components
- Document props (type, required, default, description) for all components
- Mark deprecated items with `@deprecated` and provide migration path

## Frontend Documentation

Frontend docs should capture contracts that types and screenshots alone do not make obvious.

- Document reusable components, hooks, stores, and route helpers at the public boundary, not by narrating internal implementation.
- When a feature spans multiple files, add a nearby feature or service doc that explains ownership: data, URL state, form state, client state, side effects, and analytics.
- For user-facing flows, document important states and constraints: loading, empty, error, success, disabled, optimistic, permission-restricted, and responsive behavior.
- Record accessibility expectations when they are part of the contract: labeling, keyboard flow, focus behavior, dialogs, and destructive-action safeguards.
- If automated coverage does not yet protect a risky frontend flow, include concise manual verification notes in the most natural nearby doc until tests exist.

---

## Framework Documentation (Next.js / MDX)

For projects using Next.js documentation (MDX-based), follow these conventions. Full details in `references/nextjs-doc-conventions.md`.

### Scaffolding New Feature Docs

When adding documentation for entirely new Next.js features, determine the doc type first:

| Feature Type | Doc Location | Template |
|---|---|---|
| New component | `docs/01-app/03-api-reference/02-components/` | API Reference |
| New function | `docs/01-app/03-api-reference/04-functions/` | API Reference |
| New config option | `docs/01-app/03-api-reference/05-config/` | Config Reference |
| New concept/guide | `docs/01-app/02-guides/` | Guide |
| New file convention | `docs/01-app/03-api-reference/03-file-conventions/` | File Convention |

**File naming:** kebab-case with optional numeric prefix (`05-my-feature.mdx`). Use `templates/nextjs-api-reference.mdx` and `templates/nextjs-guide.mdx` as starting points.

### MDX Conventions (Quick Reference)

**Frontmatter (required):**

```yaml
---
title: Page Title (2-3 words)
description: One or two sentences describing the page.
---
```

**Code blocks — TypeScript first, always with `filename`:**

````
```tsx filename="app/page.tsx" switcher
// TypeScript example
```

```jsx filename="app/page.js" switcher
// JavaScript example
```
````

**Router-specific content:**

```mdx
<AppOnly>Content only for App Router docs.</AppOnly>

<PagesOnly>Content only for Pages Router docs.</PagesOnly>
```

**Notes:**

```mdx
> **Good to know**: Single line note.

> **Good to know**:
>
> - Multi-line point 1
> - Multi-line point 2
```

**Props tables** — wrap in `<div style={{ overflowX: 'auto', width: '100%' }}>` for mobile scroll.

**Shared content (Pages Router):** If a Pages Router doc has `source:` in frontmatter, edit the App Router source file instead — not the Pages Router file.

**Related links in frontmatter:**

```yaml
related:
  title: Next Steps
  description: Learn more about related features.
  links:
    - app/api-reference/functions/some-function
    - app/guides/related-guide
```

### Pre-Commit Validation Checklist

Before committing Next.js documentation changes:

- [ ] Frontmatter has `title` and `description`
- [ ] Code blocks have `filename` attribute
- [ ] TypeScript examples use `switcher` with JS variant
- [ ] Props tables are wrapped for horizontal scroll
- [ ] Related links point to valid paths
- [ ] `pnpm lint` passes
- [ ] Changes render correctly (if preview available)

---

## Project Documentation Placement Rules

**Never create new directories in `docs/` outside this structure**. Use:

```
docs/
├── README.md        ← navigation index for the docs folder
├── memories/
│   ├── README.md    ← what memory artifacts are and how to write them
│   ├── logs/        ← dev logs (append only, YYYY/MM-DD/*.md, 2 lines max)
│   ├── lessons/     ← lessons learned (YYYY/MM-DD/*.md)
│   ├── facts/       ← facts from user/company context (YYYY/MM-DD/*.md)
│   ├── procedures/  ← how things should be done (YYYY/MM-DD/*.md)
│   └── fixes/       ← error solutions (YYYY/MM-DD/*.md)
├── audits/          ← comprehensive reports, ADRs, post-mortems (YYYY/MM-DD/ folders)
├── references/      ← code references, schemas (flat, no timestamps)
├── cookbook/        ← technical how-to guides (flat, no timestamps)
├── plans/           ← implementation plans, migrations (YYYY/MM-DD/ folders)
└── specs/           ← feature specs, API contracts (YYYY/MM-DD/ folders)
```

Each `docs/` subdirectory should have its own `README.md` explaining what lives there. See the "In-Folder Documentation" section below.

**Repo-local instructions override this structure** — always check for `AGENTS.md`, `CLAUDE.md`, or similar files that define project-specific doc placement rules before writing anything.

---

## Quality Standards

Good documentation passes this test: **can a new engineer understand what they need to know from this doc alone, in under 2 minutes?**

**Before writing, ask:**
- Who reads this? What do they need to know?
- Where does it live? Is that the most natural location?
- How long should it be? (Default: shorter than you think)
- When does it become outdated? Who updates it?

**After writing, verify:**
- Does every sentence earn its place?
- Are there code examples where prose would be slower to parse?
- Does the structure match how readers scan (headers, bullets, tables)?
- Is the tone right for the audience (technical vs. customer-facing)?
- Is there an existing doc to update rather than a new one to create?

---

## Additional Resources

### Reference Files

For in-depth guidance, consult:
- **`references/documentation-types.md`** — Full taxonomy of all doc types, audience, examples, when to use each
- **`references/continuous-docs.md`** — Deep guide on daily logs, changelogs, API docs, inline docs, and maintenance cadence
- **`references/frontend-documentation.md`** — Component, hook, route, design-system, and browser-behavior documentation guidance
- **`references/one-off-docs.md`** — Full guide for reports, ADRs, post-mortems, migration guides, investigation reports
- **`references/writing-standards.md`** — Tone, voice, tense, structure, anti-patterns, quality checklist, audience patterns
- **`references/nextjs-doc-conventions.md`** — Complete Next.js MDX frontmatter schema, code block formatting, MDX component usage, and writing style
- **`references/nextjs-code-to-docs-mapping.md`** — Next.js source code to documentation path mapping for PR doc reviews

### Templates

Ready-to-use templates in `templates/`:
- **`templates/daily-log.md`** — Development log format, examples, edge cases
- **`templates/memory-lesson.md`** — Lesson learned artifact
- **`templates/memory-fact.md`** — Fact artifact
- **`templates/memory-procedure.md`** — Procedure artifact
- **`templates/memory-fix.md`** — Fix artifact
- **`templates/technical-report.md`** — Technical report / audit structure
- **`templates/adr.md`** — Architecture Decision Record
- **`templates/service-readme.md`** — Service README skeleton
- **`templates/post-mortem.md`** — Post-mortem structure
- **`templates/nextjs-api-reference.mdx`** — Next.js API reference doc skeleton (components, functions, config)
- **`templates/nextjs-guide.mdx`** — Next.js guide/how-to doc skeleton

### Scripts

Utility scripts in `scripts/`:
- **`scripts/find-docs.sh`** — Locate the latest daily log file and relevant doc locations in any repo
