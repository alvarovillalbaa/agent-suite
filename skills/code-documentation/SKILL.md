---
name: code-documentation
description: This skill should be used when the user asks to write, update, review, scaffold, or reorganize documentation for code, folders, services, repos, workflows, architectural decisions, or operational processes. Trigger for `README.md`, `ARCHITECTURE.md`, `TESTS.md`, `SETUP.md`, `RUNBOOK.md`, `CHANGELOG.md`, `SECURITY.md`, `OVERVIEW.md`, `FAQ.md`, `DECISIONS.md`, `DEPENDENCIES.md`, `AGENTS.md`, `PLAN.md`, `SPEC.md`, `SOUL.md`, `PRINCIPLES.md`, `DESIGN.md`, `runbooks/**/*.md`, `docs/**/*.md`, MDX docs, JSDoc/TSDoc, docstrings, ADRs, post-mortems, migration guides, and PR documentation-impact reviews.
version: 1.3.0
---

# Code Documentation

Write documentation that stays close to the code, tells the next reader what to do, and remains maintainable by both humans and agents.

## Core model

Documentation in this repo falls into five surfaces:

1. **Inline docs** — docstrings, JSDoc/TSDoc, comments, types
2. **In-folder docs** — `README.md`, `ARCHITECTURE.md`, `TESTS.md`, and related files that explain one directory
3. **Root instruction docs** — `AGENTS.md`, `PLAN.md`, `SPEC.md`, `SOUL.md`, `PRINCIPLES.md`, `DESIGN.md`
4. **Operational runbooks** — workflow-specific procedures in `runbooks/` or a local `RUNBOOK.md`
5. **Project docs** — `docs/` for memories, audits, guides, references, cookbook entries, plans, specs, and longer-form artifacts

Default rule: put the doc in the narrowest place that future readers will naturally look first.

## Quick routing

| Need | Default location |
|---|---|
| Explain a public function, component, hook, API surface, or class | Inline docs |
| Explain what a directory is for and how to navigate it | `README.md` in that directory |
| Explain internal design or data flow for one directory | `ARCHITECTURE.md` in that directory |
| Explain how to test one directory or service | `TESTS.md` in that directory |
| Document setup or bootstrap steps for one area | `SETUP.md` in that directory |
| Document a repeatable operational workflow | `runbooks/<name>.md` or local `RUNBOOK.md` |
| Record repo-wide customization for agents, contributors, and the user's ways of working | `AGENTS.md` |
| Record how planning should be done and what plans should look like | `PLAN.md` |
| Record how specs should be written and what they must define | `SPEC.md` |
| Record the agents' personality and collaboration stance | `SOUL.md` |
| Record principles, constraints, and max/min rules that always apply | `PRINCIPLES.md` |
| Record the design system or frontend interaction language | `DESIGN.md` |
| Record a repo-level implementation plan and verification shape | `docs/plans/YYYY/YYYY-MM-DD/` |
| Record a repo-level behavior contract or requirements spec | `docs/specs/YYYY/YYYY-MM-DD/` |
| Record a general technical how-to that is not implementation-specific to this repo | `docs/guides/` |
| Record stable code or system references | `docs/references/` |
| Record how something is actually done in this codebase | `docs/cookbook/` |
| Record audits, ADRs, post-mortems, reports, or migrations | `docs/audits/YYYY/YYYY-MM-DD/` |

## `docs/` taxonomy

Use these locations consistently:

- `docs/memories/logs/` — brief logs (2 lines max, append to the latest date file) about every change made in the code
- `docs/memories/lessons/` — lessons learned from experience, related to the code
- `docs/memories/facts/` — facts about the user, company, or project that are not derivable from code
- `docs/memories/procedures/` — how things ought to be done after discovering the right workflow
- `docs/memories/fixes/` — non-obvious error solutions and fixes
- `docs/audits/` — comprehensive reports and analytical audits
- `docs/guides/` — technical guides for how to do something; not about how this repo implements it
- `docs/references/` — code and system reference docs
- `docs/cookbook/` — technical guides for how something is done in this codebase
- `docs/plans/` — implementation plans: how something should be built, tested, and behaviorally verified
- `docs/specs/` — specifications: how something should behave

Timestamped doc families use one layout only:

- `*/YYYY/YYYY-MM-DD/*.md`

That applies to memories, audits, plans, and specs. `guides/`, `references/`, and `cookbook/` stay flat with no timestamp subfolders.

## In-folder documentation contract

Outside `docs/`, every meaningful folder can carry its own documentation. Unless repo-local rules say otherwise, use this default set.

### Core

Always consider these first:

- `README.md`
- `ARCHITECTURE.md`
- `TESTS.md`

### Conditional

Add these only when the folder actually needs them:

- `SETUP.md`
- `RUNBOOK.md`
- `CHANGELOG.md`
- `SECURITY.md`

### Rare

Use these when the domain justifies them:

- `OVERVIEW.md`
- `FAQ.md`
- `DECISIONS.md`
- `DEPENDENCIES.md`

### File intent

- `README.md` — entry point, purpose, usage, links to neighboring docs
- `ARCHITECTURE.md` — internals, flows, boundaries, design decisions
- `TESTS.md` — how to run tests, test layout, fixtures, expectations
- `SETUP.md` — non-obvious environment and initialization steps
- `RUNBOOK.md` — local operational procedure for this folder
- `CHANGELOG.md` — user-facing or package-facing release history
- `SECURITY.md` — security boundaries, secrets handling, abuse cases, review expectations
- `OVERVIEW.md` — concept-first orientation when a README would become too dense
- `FAQ.md` — repeated questions and troubleshooting
- `DECISIONS.md` — folder-local decisions that do not justify standalone ADRs
- `DEPENDENCIES.md` — dependency map, contracts, and upgrade notes

Use the smallest set that makes the folder legible. Do not create files just to satisfy the list.

## Root instruction docs are documentation

Treat these as first-class documentation, not miscellaneous meta files:

- `AGENTS.md` — general customization to the user's needs, codebase, and ways of working
- `PLAN.md` — how planning should be done and what plans should look like
- `SPEC.md` — how specs should be written and what they must contain
- `SOUL.md` — personality and collaboration stance for AI agents
- `PRINCIPLES.md` — principles, constraints, and max/min rules that should always be followed
- `DESIGN.md` — the design system and frontend interaction language when the repo has one

When a change affects how the repo is operated, designed, or extended, review these files the same way you would review a README or architecture doc.

## Runbooks

Use a runbook when the reader must perform a workflow, not just understand a concept.

### When to create one

- The process crosses files, tools, environments, or services
- Order matters and mistakes are expensive
- The workflow has verification, rollback, escalation, or handoff steps
- The procedure is likely to be repeated by a different person or agent

### Where it lives

- `runbooks/<workflow>.md` for repo-wide or multi-folder processes
- `<folder>/RUNBOOK.md` for a folder-local workflow tied to one subsystem

Prefer `runbooks/` when the workflow spans folders, services, or roles. Do not bury repeatable procedures inside long `docs/` pages or unrelated READMEs.

### Minimum sections

1. Purpose
2. Preconditions
3. Inputs or required context
4. Step-by-step procedure
5. Verification
6. Rollback or recovery
7. Escalation and linked docs

Keep commands copy-pasteable. Prefer concrete checks over narrative explanation.

### Quality cues

Borrow the quality bar from mature operational runbooks:

- state when to use the workflow and when not to use it
- surface dangerous or irreversible steps before the reader reaches them
- include health checks before and after risky steps
- record owner and last-verified context when the runbook will be reused operationally
- rehearse or dry-run the procedure outside incidents whenever practical

## Relationship to `auto-improve`

`code-documentation` defines what good documentation looks like. `auto-improve` is the mechanism that should tighten documentation that keeps drifting, confusing readers, or missing operational details.

When documentation work reveals repeated gaps, stale instruction files, or recurring workflow confusion:

- treat `AGENTS.md`, `PLAN.md`, `SPEC.md`, `SOUL.md`, `PRINCIPLES.md`, `DESIGN.md`, `runbooks/**/*.md`, the in-folder docs above, and the `docs/` taxonomy here as valid documentation targets
- prefer fixing the upstream doc rather than patching the same explanation into many places
- keep the same surface model between skills: `code-documentation` defines the doc taxonomy, and `auto-improve` should harden that same taxonomy automatically
- make `auto-improve` treat the root instruction docs as first-class documentation, not special-case meta files
- keep timestamped docs on `*/YYYY/YYYY-MM-DD/*.md` and flat docs on `docs/guides/`, `docs/references/`, and `docs/cookbook/`
- if the issue is systemic rather than one-off, route follow-up hardening through `skills/auto-improve/`

## Workflow

1. Check for repo-local rules first: `AGENTS.md`, `CLAUDE.md`, project READMEs, or existing doc conventions.
2. Decide the surface: inline, folder, root instruction doc, runbook, or `docs/`.
3. Update the closest existing document before creating a new one.
4. If creating folder docs, start with the Core set and add Conditional or Rare files only when justified.
5. If the destination is timestamped, use `*/YYYY/YYYY-MM-DD/*.md`; do not invent alternative date layouts.
6. Link neighboring docs so readers can move from overview to procedure to deeper design.
7. Keep code examples real and commands executable.
8. If the task is a documentation impact review, inspect the diff and map changed code to the docs above.

## Quality bar

Good documentation lets the next engineer or agent answer all of these quickly:

- What is this?
- When should I use it?
- What do I do next?
- What can go wrong?
- Where is the deeper detail?

Prefer short, high-signal docs over exhaustive prose. If a README becomes dense, split depth into `ARCHITECTURE.md`, `RUNBOOK.md`, `DECISIONS.md`, or `docs/`.

## Next.js / MDX

For Next.js or MDX-heavy repositories, keep using the existing references and templates in this skill:

- `references/nextjs-doc-conventions.md`
- `references/nextjs-code-to-docs-mapping.md`
- `templates/nextjs-api-reference.mdx`
- `templates/nextjs-guide.mdx`

Use them only when the repo actually follows that MDX documentation style.

## References

Load only what the task needs:

- `references/documentation-types.md` — documentation taxonomy, including root docs and in-folder defaults
- `references/continuous-docs.md` — logs, changelogs, inline docs, maintenance cadence
- `references/frontend-documentation.md` — component, hook, route, and UX-contract docs
- `references/one-off-docs.md` — ADRs, reports, post-mortems, migrations
- `references/writing-standards.md` — tone, structure, anti-patterns
- `references/nextjs-doc-conventions.md` — MDX conventions
- `references/nextjs-code-to-docs-mapping.md` — Next.js source-to-doc mapping

## Templates

- `templates/service-readme.md`
- `templates/runbook.md`
- `templates/daily-log.md`
- `templates/memory-lesson.md`
- `templates/memory-fact.md`
- `templates/memory-procedure.md`
- `templates/memory-fix.md`
- `templates/technical-report.md`
- `templates/adr.md`
- `templates/post-mortem.md`
- `templates/nextjs-api-reference.mdx`
- `templates/nextjs-guide.mdx`

## Script

- `scripts/find-docs.sh` — locate existing docs and recent log destinations before creating new files
