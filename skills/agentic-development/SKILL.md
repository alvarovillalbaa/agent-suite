---
name: agentic-development
description: End-to-end repository execution workflow for implementing, debugging, refactoring, reviewing, instrumenting, explaining architecture, assessing refactor impact, and shipping code in any software repo. Use when the assistant needs to orient in an unfamiliar codebase, choose between direct execution and supervised harness loops, keep specs, plans, and tests distinct, coordinate builder and reviewer passes, handle PR feedback, inspect observability, or land cross-cutting frontend and backend changes without leaving loose ends.
---

# Agentic Development

Drive work through one loop: orient, classify the task, choose the execution mode, implement, review, verify, and compound. Treat repo-local instructions and existing architecture as the source of truth. For repeated or long-running work, keep the loop supervised: fresh context each iteration, state on disk, one task at a time, hard gates, and explicit reviewer output.

## Start Here

1. Run the repo scan helper if the skill bundles one; otherwise do the same discovery manually from the repo root.
2. Map the repo before touching code: instruction files, package or service boundaries, entrypoints, build and test commands, deployment surfaces, and current git state. The authoritative source of truth for project knowledge is the codebase itself and `docs/` — read implemented code and documented decisions before making assumptions.
3. For frontend-heavy work, map framework boundaries, route ownership, design-system sources, shared primitives, state owners, and existing analytics or error-reporting seams before choosing an edit path.
4. Decide the task type and execution mode: implementation, review, architecture explanation, debugging, refactor, instrumentation, or release cleanup; then choose direct execution or a supervised harness loop if code will be written.
5. Choose the authoritative path for the change or explanation: the existing module, service, component, hook, page, command, model, or workflow that already owns the behavior.
6. Decide the proof before editing: what command, test, log, screenshot, trace, dependency search, or reviewer output will confirm the result.
7. Load only the reference files relevant to the current task.

## Core Rules

- Prefer repo-local instructions over generic advice. If `AGENTS.md`, `CLAUDE.md`, `SOUL.md`, `PRINCIPLES.md`, `PLANS.md`, `README.md`, `CONTRIBUTING.md`, or service/package docs exist, follow them in the hierarchy the repo defines.
- Work with the current git reality. Do not force a branch or worktree change just because `main` is active; choose the safest path that fits the user's intent.
- Extend existing seams. Reuse current services, hooks, stores, component primitives, models, logging, analytics, and scripts instead of creating parallel abstractions. Prefer updating an existing file over creating a new one — embed functionality into the module that already owns the behavior.
- Architecture claims need evidence. Trace entrypoints, ownership, dependencies, and contracts before explaining how the system works or what a refactor will affect.
- Separate concerns intentionally: specs define behavior, plans define execution, progress files record loop state, tests prove behavior, and instrumentation explains production behavior.
- Treat context as scarce. Keep instruction files, prompts, and scratchpads compact; use index files and on-demand references instead of stuffing every loop with full docs.
- One task per loop. If work spans multiple iterations, persist state on disk and restart with fresh context instead of dragging a swollen transcript forward.
- Hard gates decide readiness. In harness or agent-loop mode, gates that can block or advance work must be binary pass or fail, not advisory.
- Structured review beats narrative when another agent or loop must consume the result. Emit compact findings with severity, file, line, risk, and expected fix.
- When broad permissions or network access are required, prefer the smallest blast radius: isolated branch or worktree, sandbox or ephemeral environment, and least-privilege credentials.
- Verification gates claims. Do not say fixed, complete, passing, or ready without fresh evidence.
- Frontend work is product behavior, not decoration. Preserve design systems, router conventions, state ownership, accessibility, and interaction quality the same way you would preserve API boundaries in a backend.
- Choose the right frontend artifact level before coding: primitive, composed control, domain component, page section, hook, store, or route. A bad boundary choice causes more churn than a small implementation bug.
- Finish cleanly. Make the next integration step explicit instead of silently leaving the repo in an ambiguous state.
- Seek clarification by default for any decision not already anchored in existing patterns. When an existing pattern is found, apply senior/principal-engineer judgement: evaluate whether it should be improved or preserved, then ask the user — prefer hybrid decisions that satisfy both evolution and backward consistency (framework choices excepted: frameworks are stable anchors).
- Apply senior and principal engineering standards in all work areas — frontend, backend, and beyond. Prefer the highest-quality, most maintainable implementation that fits the codebase and team conventions, not merely the minimum that compiles or passes tests.
- The authoritative source for all project knowledge is the codebase itself and `docs/`. Discover by reading implemented code and documented decisions before making assumptions. Do not invent conventions the codebase does not already follow.

## Execution Modes

- Direct execution: use for small, clear changes with a single coherent proof path.
- Supervised harness loop: use for repeated or backlog-style work only when the spec is clear, the change surface is isolated, and the repo has trustworthy gates. Keep each iteration fresh and single-purpose.
- Review or explanation mode: use for architecture mapping, impact analysis, code review, or debugging passes where the immediate output is understanding or findings rather than code.

Switch modes when the evidence changes. If a harness starts flailing, shrink the task, tighten the spec, or return to direct execution.

## Architecture Bias

Apply these defaults unless the repo clearly prefers something else:

- Maximize reuse and minimize total LOC.
- Prefer one authoritative implementation path over duplicated variants.
- Avoid repeated logic and near-duplicate code with the same purpose.
- Do not over-modularize. Split only when independence, ownership, or readability materially improves. Monolithic files are acceptable when the logic is cohesive.
- No backward-compatibility shims or facades. When rearchitecting, update all import paths and call sites directly rather than adding re-export wrappers or compatibility layers.
- Avoid dead code. Remove unused imports, unreachable branches, stale feature flags, and code left behind after any refactor or behavioral change.
- Favor cohesive vertical slices over scattering one concept across many files.
- Push business logic and async orchestration out of leaf UI where possible; keep views readable and state ownership explicit.
- Prefer composition, slots, or subcomponents over boolean-heavy component APIs and prop matrices.
- Treat loading, empty, error, success, and responsive states as part of the implementation, not post-hoc polish.
- Widely-used utilities, helpers, types, constants, and shared logic belong in global folders — not duplicated per feature or service. Before creating a new local helper, search for an existing global one and extend it. When something is used in three or more places, promote it to the global location.
- Within a folder, prefer a `base` file that encodes shared logic; specialized files extend or compose from it. This makes the abstraction boundary explicit, reduces duplication, and centralizes the surface area for future changes.

## Workflow Router

### Orientation and repo policy

Read [repo-orientation.md](./references/repo-orientation.md) for startup discovery, instruction-file handling, repo-shape detection, and initial command selection.

### Harness loops and persistent task state

Read [harness-loops.md](./references/harness-loops.md) when the task is large enough for repeated agent iterations, when specs or plans live on disk between runs, when builder and reviewer passes should be split, or when you need to decide whether a repo is ready for higher-autonomy execution.

### Architecture analysis and refactor impact

Read [architecture-analysis.md](./references/architecture-analysis.md) when the user asks how the system works, wants dependency or data-model relationships explained, needs impact analysis before a rename, move, extraction, or schema change, or wants to create or evaluate an Architecture Decision Record (ADR) — choosing between technologies, documenting a design decision with trade-offs, reviewing a system design proposal, or designing a new component from requirements.

### Git, branches, worktrees, and PR flow

Read [collaboration-and-git.md](./references/collaboration-and-git.md) when the task touches branching strategy, worktrees, PRs, merges, or cleanup.

### Spec-driven, plan-driven, and test-driven delivery

Read [specs-plans-tests.md](./references/specs-plans-tests.md) when the user asks for a plan or spec, when scope is fuzzy, or when writing any implementation code. Contains the Iron Law (no production code without a failing test first), the Red-Green-Refactor cycle, the pre-completion verification checklist, and common TDD rationalizations to reject. TDD is the default delivery mode for any behavioral change.

### Subagents and parallel work

Read [subagents-and-parallelism.md](./references/subagents-and-parallelism.md) for controller and worker patterns, review loops, and safe parallelization.

### Reviews, comments, and PR feedback

Read [reviews-and-comments.md](./references/reviews-and-comments.md) when reviewing code, receiving review feedback, or addressing GitHub, Sentry, or CI comments.

### Observability and debugging

Read [observability.md](./references/observability.md) before adding logs or instrumentation, and whenever debugging should start from existing signals instead of guesswork.

### Backend execution

Read [backend-development.md](./references/backend-development.md) for service-layer, data-model, API, async, and architecture heuristics. Includes the canonical platform architecture pattern (API → Serializer → Service → BaseService, AI Agent → Tool Call → Service), hard rules for API design (UUID path params, one-view-per-model, all CRUD methods consolidated), data model minimization (multi-purpose models, JSONField vs columns, relations over repeated fields, composable mixins), and the core philosophy (maximize LOC reuse, minimize total LOC, single point of truth, no repeated logic, no over-modularization).

### Frontend execution

Read [frontend-development.md](./references/frontend-development.md) for framework boundary detection, reusable component design, UI implementation, refactor workflow, async UX, accessibility, responsive quality, performance priorities, analytics, and automation scripts (component generator, bundle analyzer, frontend scaffolder).

### UI constraints and patterns

Read [ui-constraints.md](./references/ui-constraints.md) for hard MUST/NEVER/SHOULD rules covering stack defaults (Tailwind, motion/react, cn), accessible component primitives, interaction patterns (AlertDialog, skeletons, h-dvh, safe-area-inset), animation budget and compositor-only rules, typography helpers (text-balance, tabular-nums), layout conventions (z-index scale, size-*), performance guards, and design constraints (no unsolicited gradients, one accent color, empty-state affordances). Apply these on top of frontend-development.md whenever touching UI code.

### Design engineering and animation craft

Read [design-engineering.md](./references/design-engineering.md) when the task involves animation decisions, interaction polish, UI review feedback, component building, gesture interactions, or perceived performance. Covers the animation decision framework (should animate? easing? duration?), spring animations, CSS transform mastery, clip-path techniques, gesture and drag patterns, hardware acceleration, accessibility (prefers-reduced-motion), stagger animations, exit animations with AnimatePresence (modes, nested presence, useIsPresent), container animation (two-div pattern, ResizeObserver), morphing icons (three-line SVG system), and debug workflows. Use alongside ui-constraints.md: constraints define the hard rules; this reference provides the craft depth and the before/after review format.

### Comprehensive UI/UX guidelines

Read [ui-ux-guidelines.md](./references/ui-ux-guidelines.md) when designing new pages or components, reviewing UI for quality, accessibility, or usability, choosing styles, typography, or color palettes, implementing navigation patterns or forms, adding chart/data visualization, adding audio feedback or sound synthesis, implementing prefetching strategies, or when the task changes how a feature looks, feels, moves, or is interacted with. Contains 12 priority-ordered rule categories (accessibility, touch & interaction, performance, style selection, layout, typography & color, animation, forms & feedback, navigation patterns, charts & data, audio feedback + sound synthesis, predictive prefetching) synthesized from Apple HIG, Material Design 3, WCAG, and Laws of UX. Use alongside `ui-constraints.md` (Tailwind/React hard rules) and `design-engineering.md` (animation craft).

### Web interface guidelines review

Read [web-design-guidelines.md](./references/web-design-guidelines.md) when the user asks to review UI code, audit design, check accessibility, or validate a page against best practices. This procedure fetches the live Web Interface Guidelines ruleset and applies it to the target files, emitting findings in `file:line` format. Run alongside ui-constraints.md and ui-ux-guidelines.md for a full UI audit.

### Design critique

Read [design-critique.md](./references/design-critique.md) when the user shares a Figma URL, screenshot, or design description and asks for feedback — "review this design", "critique this mockup", "what do you think of this screen?". Contains the five-dimension critique framework (first impression, usability, visual hierarchy, consistency, accessibility), severity-graded output format, and guidance on matching feedback depth to the design stage (exploration vs. final polish). Use alongside design-engineering.md for animation and interaction findings, and pre-shipping-polish.md for the final quality pass.

### Design system audit, documentation, and extension

Read [design-system.md](./references/design-system.md) when the task is about the design system itself rather than a specific feature: auditing naming inconsistencies or hardcoded values across components, documenting a component's variants/states/props/accessibility notes, or designing a new pattern that fits the existing system. Provides three structured modes (audit / document / extend) with scored output tables and output templates. Use alongside shadcn.md for component CLI/theming and building-components.md for API design when extending the system.

### shadcn/ui components

Read [shadcn.md](./references/shadcn.md) when the task involves adding, searching, fixing, debugging, styling, or composing shadcn/ui components; when working with `components.json`, preset codes, or a custom component registry; when initializing a new project with `npx shadcn@latest init`; or when updating existing components while preserving local changes. Contains critical rules (styling, forms, composition, icons, base-vs-radix), the full CLI reference, theming and CSS variable guidance, the component selection table, the smart-merge update workflow, and an MCP server reference for AI-assisted registry operations.

### Component refactoring

Read [component-refactoring.md](./references/component-refactoring.md) when the task is specifically to reduce component complexity, split a large component, extract hooks, consolidate modal state, simplify conditional logic, or restructure a component's directory layout. Use alongside frontend-development.md for the broader delivery context.

### Building reusable components and libraries

Read [building-components.md](./references/building-components.md) when the task is to design a component API, build a component library or primitive, implement accessibility patterns (ARIA, keyboard nav, focus management), choose between controlled and uncontrolled state, use composition patterns (compound components, asChild, polymorphism, boolean-prop avoidance, state/actions/meta provider pattern, children over render props, explicit variant components), set up styling systems (cn, CVA, design tokens, data-state, data-slot), decide on a distribution strategy (registry, npm, marketplace), or apply React 19 API changes (ref as prop, use() instead of useContext()).

### Code scaffolding (Cloush stack)

Read [code-scaffolding.md](./references/code-scaffolding.md) when the task is to create a new Django app, generate models, serializers, viewsets, or URL routing, scaffold frontend TypeScript types or Zod schemas, or produce test stubs for the Cloush Django/DRF + Next.js stack. Follows Cloush conventions: `SearchDetailModel`, `AccessControlSerializerMixin`, `UnifiedAccessChecker`.

### React and Next.js performance rules

Read [react-performance-rules.md](./references/react-performance-rules.md) when writing, reviewing, or refactoring React or Next.js code — especially when the task involves data fetching, bundle optimization, re-render churn, or rendering cost. Contains 45 rules across 8 priority tiers with the critical patterns (waterfall elimination, barrel imports, `React.cache()`, `Promise.all`) inlined and individual rule files with code examples in [react-rules/](./references/react-rules/).

### Next.js best practices

Read [next-best-practices.md](./references/next-best-practices.md) when writing or reviewing Next.js code. Covers file conventions, RSC boundaries, async API patterns (params, searchParams, cookies, headers), runtime selection (Node.js vs Edge), directives (`'use client'`, `'use server'`, `'use cache'`), functions (useRouter, useSearchParams, generateStaticParams), error handling (error.tsx, redirect, notFound, unstable_rethrow), data patterns (Server Components vs Server Actions vs Route Handlers, waterfall avoidance), route handlers, metadata and OG images, image optimization (next/image), font optimization (next/font), bundling issues (server-incompatible packages, ESM/CommonJS), scripts (next/script), hydration errors, Suspense boundaries, parallel and intercepting routes, self-hosting (Docker, ISR cache handlers), and debug tricks. Individual detail files in [next-best-practices/](./references/next-best-practices/). Use alongside react-performance-rules.md for performance concerns.

### Self-improvement and pattern learning

Read [self-improvement.md](./references/self-improvement.md) when the session ends and patterns should be consolidated, when a skill produced an incorrect outcome, when a recurring pattern (3+ occurrences) should be promoted into permanent reference guidance, or when the user asks to "self-improve", "learn from today", or "analyze this session". Uses a multi-memory architecture (semantic patterns, episodic experiences, working session state) with evolution and correction markers for traceability.

### Autonomous reference optimization (autoimprove)

Read [autoimprove.md](./references/autoimprove.md) when the user says "run autoresearch on [reference]", "autoimprove", "optimize this skill autonomously", or when a reference has a known recurring quality problem (same failure pattern 3+ times). Implements Karpathy's autoresearch loop: define a 3–6 item binary checklist, establish a baseline pass rate, then iterate — change one thing, test, keep if score improves, revert if not — until 95%+ pass rate is reached on 3 consecutive rounds. Produces an improved reference copy, a round-by-round changelog, and a machine-readable results log.

### Skill extraction (claudeception)

Read [skill-extraction.md](./references/skill-extraction.md) when a task produced non-obvious knowledge worth preserving as a reusable skill; the user says "save this as a skill", "extract a skill", or "what did we learn?"; `/claudeception` is invoked; or debugging required significant investigation with a non-obvious root cause. Creates new `SKILL.md` files in `.claude/skills/` or `~/.claude/skills/` — growing the skill library rather than updating existing references. Includes a decision matrix (create / update / add variant), a web-research step before writing, quality gates, and a versioning convention.

### Continual learning — maintaining CLAUDE.md / AGENTS.md memory

Read [continual-learning.md](./references/continual-learning.md) when the user asks to "update memory", "mine prior sessions", "keep CLAUDE.md current", or "run continual learning"; or when the cadence gate fires (≥10 completed turns AND ≥120 min since last run AND transcript has advanced). Incrementally mines transcript deltas for durable user preferences and stable workspace facts, writes them as plain bullets to the two learned sections of `CLAUDE.md` / `AGENTS.md`, and refreshes the transcript index. Delegates mining and writing to the `agents-memory-updater` subagent (`agents/agents-memory-updater.md`).

### Repo-local learning system (learning/ folder)

Read [learning-system.md](./references/learning-system.md) when the user says "save what we learned", "extract lessons", "mine this session", or wants a `learning/` folder that stores engineering knowledge as items, episodes, decision-traces, triples, lessons, collections, procedures, and beliefs. Operates a 4-step loop (orient → capture → consolidate → promote). Supporting references: [learning-folder-structure.md](./references/learning-folder-structure.md), [learning-extraction-patterns.md](./references/learning-extraction-patterns.md), [learning-promotion.md](./references/learning-promotion.md), [learning-knowledge-graph.md](./references/learning-knowledge-graph.md), [learning-repo-adaptation.md](./references/learning-repo-adaptation.md). Scripts in `scripts/` handle init, capture, scan, and refresh. When promoting `learning/` artifacts to human-readable docs, use `docs/memories/` — placement rules defined in the `code-documentation` skill.

### Documentation placement

When writing to `docs/` — logs, lessons, facts, procedures, fixes, audits, plans, specs, or cookbook guides — follow the `code-documentation` skill. That skill owns the `docs/` folder structure and format templates. The key structure: `docs/memories/<type>/YYYY/MM-DD/*.md` for all memory artifacts, `docs/audits/YYYY/MM-DD/` for comprehensive reports, `docs/plans/YYYY/MM-DD/` and `docs/specs/YYYY/MM-DD/` for implementation work. Do not invent new top-level `docs/` directories.

### Pre-shipping polish

Read [pre-shipping-polish.md](./references/pre-shipping-polish.md) when the feature is functionally complete and needs a final quality pass before shipping. Covers visual alignment and spacing, typography refinement, color and contrast, all interaction states (hover/focus/active/disabled/loading/error/success), micro-interactions and transitions, content and copy consistency, icons and images, forms and inputs, edge cases and error states, responsiveness, performance, and code hygiene. Includes a full polish checklist and final verification steps. Use after `ui-constraints.md` and `design-engineering.md` for a complete pre-ship review.

### Verification and completion

Read [verification-and-finish.md](./references/verification-and-finish.md) before declaring success, opening or merging a PR, or cleaning up a branch or worktree.

## Standard Execution Loop

1. Orient: inspect repo instructions, architecture, git state, and current task context. Discover by reading the codebase and `docs/` before making assumptions.
2. Classify: decide whether this is implementation, architecture analysis, debugging, review, refactor, instrumentation, or release work.
3. Anchor: find the existing owner of the behavior and the minimal safe change surface. Identify any global utilities or base files that should be extended rather than duplicated.
4. Implement: make the smallest coherent change that solves the right problem, not just the nearest symptom. Apply senior/principal engineering standards — highest quality that fits the codebase, not just minimum viable.
5. Verify: run the focused proof first, then any broader regression evidence the repo or user expects. Keep tests updated — follow the `quality-assurance` skill for test strategy, coverage, and anti-patterns.
6. Compound: surface follow-up risks, rollout notes, and cleanup the next engineer will need. Keep documentation updated — follow the `code-documentation` skill for placement and format inside `docs/`. Do not leave the repo with stale docs or failing tests after a behavioral change.

## Skill Orchestration

If the current environment exposes more specialized skills, route work through them instead of bloating this skill:

- Use `create-plan` when the user explicitly asks for a plan.
- Use `quality-assurance` when verification strategy, flaky tests, review findings, or CI triage becomes the bottleneck. Also use `quality-assurance` `references/testing-anti-patterns.md` when writing mocks, adding test utilities, or reviewing test code for mock misuse or test-only methods bleeding into production classes.
- Use `gh-address-comments` for GitHub review-thread triage and inline replies.
- Use `gh-fix-ci` when GitHub Actions checks are failing.
- Use [self-improvement.md](./references/self-improvement.md) at session end or after errors to extract patterns and keep reference guidance up to date. Templates live in `templates/` and accumulated patterns in `memory/semantic-patterns.json`.
- Use [autoimprove.md](./references/autoimprove.md) for autonomous, batch optimization of a specific reference — define a binary checklist, let the agent iterate unattended, ship only after reviewing the diff and score improvement.
- Use [skill-extraction.md](./references/skill-extraction.md) to create new `SKILL.md` files from session learnings — invoked via `/claudeception`, "save this as a skill", or after any non-obvious debugging. Use `templates/new-skill-template.md` as the scaffold.
- Use [continual-learning.md](./references/continual-learning.md) to keep `CLAUDE.md` / `AGENTS.md` current with durable user preferences and workspace facts mined from transcript deltas. Cadence-gated (≥10 turns, ≥120 min, transcript advanced). Delegates to `agents/agents-memory-updater.md`.
- Use [learning-system.md](./references/learning-system.md) for the repo-local `learning/` folder system — 8 artifact types (items → episodes → triples → lessons → collections → procedures → beliefs), 4-step operating loop, and promotion into identity/doc files. Scripts: `scripts/init-learning.sh`, `scripts/capture-item.py`, `scripts/scan-learning.py`, `scripts/refresh-learning.py`. When promoting to human-readable docs, write to `docs/memories/` (see `code-documentation` skill for format and placement rules).
- Use the `code-documentation` skill whenever writing any documentation to the repo — logs, lessons, facts, procedures, fixes, audits, plans, specs, cookbook guides, or service docs. That skill owns `docs/` folder structure, naming conventions, and format templates.
- Use dedicated component-building, frontend-design, browser-testing, observability, analytics, or release skills when they exist. Otherwise, use the references in this skill. For design system work at the system level (auditing token coverage, naming consistency, or component completeness; documenting component variants and states; or proposing a new pattern), use [design-system.md](./references/design-system.md). For shadcn/ui component work (adding components, CLI operations, styling rules, forms, composition, theming, preset management), use [shadcn.md](./references/shadcn.md). For component complexity reduction specifically, use [component-refactoring.md](./references/component-refactoring.md). For building reusable components or libraries (API design, a11y patterns, composition, boolean-prop avoidance, state/actions/meta provider pattern, explicit variants, children over render props, React 19 APIs, styling systems, distribution), use [building-components.md](./references/building-components.md). For comprehensive UI/UX guidelines (12 priority categories: accessibility, touch, performance, style, layout, typography, animation, forms, navigation, charts, audio feedback + sound synthesis, predictive prefetching — synthesized from Apple HIG, Material Design, WCAG, and Laws of UX), use [ui-ux-guidelines.md](./references/ui-ux-guidelines.md). For UI compliance reviews, design audits, or accessibility checks against the official Web Interface Guidelines, use [web-design-guidelines.md](./references/web-design-guidelines.md). For structured design critique of Figma designs, screenshots, or mockups (first impression, usability, hierarchy, consistency, accessibility, severity-graded output), use [design-critique.md](./references/design-critique.md). For React and Next.js performance review (waterfalls, bundle size, re-render churn, server-side caching), use [react-performance-rules.md](./references/react-performance-rules.md). For Next.js file conventions, RSC boundaries, async APIs, data patterns, error handling, metadata, image/font optimization, bundling, hydration errors, Suspense, and self-hosting, use [next-best-practices.md](./references/next-best-practices.md). For animation decisions, interaction polish, gesture patterns, or UI review feedback (before/after table format), use [design-engineering.md](./references/design-engineering.md). For the final pre-shipping quality pass (alignment, spacing, interaction states, copy, edge cases, checklist), use [pre-shipping-polish.md](./references/pre-shipping-polish.md).

## Hooks

This skill ships three hooks. Wire them in Claude Code settings (`~/.claude/settings.json`), replacing `/absolute/path/to/agentic-development` with the actual path.

### Completion gate — `hooks/check-completion.sh`

Blocks premature stopping and forces a final pass over the original request, plan or spec state, verification evidence, recent errors, and integration cleanup.

```json
{
  "hooks": {
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "/absolute/path/to/agentic-development/hooks/check-completion.sh",
            "timeout": 10
          }
        ]
      }
    ]
  }
}
```

Set `AGENTIC_DEV_MAX=0` for no continuation cap, or any positive integer to limit repeated stop interceptions.

### Tool logging and error capture

`hooks/pre-tool.sh` logs every `Bash`, `Write`, and `Edit` invocation to stderr.
`hooks/post-bash.sh` captures non-zero exit codes into `memory/working/last_error.json` for the self-improvement loop.
`hooks/session-end.sh` writes `memory/working/session_end.json` so the self-improvement phase knows the session is complete.

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash|Write|Edit",
        "hooks": [
          {
            "type": "command",
            "command": "bash /absolute/path/to/agentic-development/hooks/pre-tool.sh \"$TOOL_NAME\" \"$TOOL_INPUT\""
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": "bash /absolute/path/to/agentic-development/hooks/post-bash.sh \"$TOOL_OUTPUT\" \"$EXIT_CODE\""
          }
        ]
      }
    ],
    "Stop": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "/absolute/path/to/agentic-development/hooks/check-completion.sh",
            "timeout": 10
          },
          {
            "type": "command",
            "command": "bash /absolute/path/to/agentic-development/hooks/session-end.sh"
          }
        ]
      }
    ]
  }
}
```
