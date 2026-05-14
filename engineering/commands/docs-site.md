---
name: docs-site
description: Autonomously research a software project and generate a complete, polished documentation website deployed to Vercel.
argument-hint: "[path to project root, or leave blank for current directory]"
allowed-tools: [Read, Write, Edit, Bash, Agent, AskUserQuestion, Skill]
---

Use skill: **code-documentation** — `skills/code-documentation/SKILL.md`.
Also use: `skills/code-documentation/references/docs-site.md` and `skills/code-documentation/references/project-research.md`.

You are generating a complete documentation website for a software project. This is a multi-phase autonomous task. Work through all phases in sequence. Do not stop to ask unless you hit a genuine blocker.

---

## Phase 1 — Project Research

Goal: build a complete mental model of the project before writing a single word of documentation.

1. Locate the project root (use the argument or current directory).
2. Read the top-level README, ARCHITECTURE.md, CHANGELOG.md, and any existing docs.
3. Read the package manifest (`package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`, etc.) to understand the stack, dependencies, and scripts.
4. Map the full directory tree. Identify: source files, tests, config files, examples, scripts.
5. Read entry points (e.g., `src/index.ts`, `main.py`, `cmd/`, `cli.go`, `bin/`) to understand the public API or CLI.
6. Read at least 10 representative source files across different subsystems.
7. Read test files to understand expected behavior and edge cases.
8. Read example files if they exist — they often show the intended usage better than source.
9. Build a **feature inventory**: a list of all meaningful capabilities the project exposes.
10. Note the project philosophy, design constraints, and non-obvious decisions.

Output of this phase (internal, not written to disk): complete understanding of what the project does, how it works, and what users need to know.

---

## Phase 2 — Documentation Structure Design

Goal: plan a documentation site structure before writing any pages.

Design the page tree:

- **Getting Started** — installation, quick start, first working example
- **Concepts** — the mental models, philosophy, and architecture a user needs to understand before going deeper
- **Guides** — task-oriented how-to articles grouped by user intent
- **Reference** — exhaustive API/CLI/config reference
- **Examples** (optional) — annotated complete examples
- **Changelog** (optional) — version history

Rules:
- Group by user intent, not by internal code structure.
- Every feature from the feature inventory must appear somewhere.
- Concept articles explain *why*, not *how*. At least two are required.
- The getting started section must produce a working result in under 5 minutes.

---

## Phase 3 — Content Writing

Goal: write all documentation pages at the highest quality bar.

For each page:
- Use the audience-first principle from `references/writing-standards.md`.
- Every code example must be runnable.
- Concept articles explain philosophy and mental model, not just mechanics.
- Getting started must have the minimal working example first, then depth.
- Reference pages must be exhaustive: every option, flag, method, and config key.

Write all pages to `docs/pages/` as `.mdx` files following the structure from Phase 2.

---

## Phase 4 — Nextra Site Scaffolding

Goal: turn the `.mdx` content into a running Nextra documentation site.

Follow `references/docs-site.md` exactly for:
- `docs/package.json`
- `docs/next.config.js`
- `docs/theme.config.tsx`
- `docs/pages/_meta.json` (navigation structure)
- `docs/pages/index.mdx` (landing page)

Install dependencies and verify the site runs locally:

```bash
cd docs && npm install && npm run dev
```

Fix any build errors before proceeding.

---

## Phase 5 — Vercel Deployment (optional)

Ask the user: "Deploy to Vercel? (y/n)"

If yes:
1. Ensure `vercel.json` is set up for the `docs/` subdirectory if the project root is not the docs root.
2. Run `vercel --prod` from within `docs/`.
3. Return the deployment URL.

---

## Delivery

When complete, report:
- The deployed URL (if deployed)
- The local dev command to preview
- The page count and section structure
- Any documentation gaps identified during research
