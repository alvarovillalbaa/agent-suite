---
name: agentic-development
description: >-
  Use for end-to-end software execution in an unfamiliar or complex repo:
  orienting the codebase, choosing an execution model, planning and verifying
  changes, reviewing architecture or PRs, and coordinating work across the
  specialized `frontend` and `backend` engineering skills.
---

# Agentic Development

This skill is the orchestration layer for software engineering work. It owns repo orientation, execution-mode selection, planning, review discipline, verification gates, release flow, and cross-domain coordination. It no longer owns frontend- or backend-specific implementation depth; route those concerns into [`../frontend/SKILL.md`](../frontend/SKILL.md) and [`../backend/SKILL.md`](../backend/SKILL.md).

## Start Here

1. Run the repo scan helper if available, or manually map the repo from the root.
2. Read repo-local instructions before proposing architecture or touching code.
3. Identify the task type: implementation, review, debugging, architecture analysis, refactor, release, or planning.
4. Decide the execution mode before coding: direct execution, subagents, team-of-agents, or supervised loop.
5. Decide the proof path before editing: tests, traces, screenshots, logs, reviewer output, or deploy evidence.
6. Route implementation detail to the right specialist:
   - UI, browser behavior, accessibility, design systems, components, React, Next.js, motion, and visual polish go to [`../frontend/SKILL.md`](../frontend/SKILL.md).
   - APIs, services, schemas, persistence, queues, auth, caching, and server behavior go to [`../backend/SKILL.md`](../backend/SKILL.md).
7. For coordinated features, keep this skill as controller and use the frontend/backend skills for the domain slices.

## Core Rules

- Prefer repo-local instructions over generic advice.
- Extend existing seams instead of creating parallel abstractions.
- Architecture claims need evidence from implemented code and docs.
- Keep research context separate from implementation context.
- One task per loop. If work stretches across iterations, persist state on disk and restart with fresh context.
- Verification gates claims. Do not say fixed, complete, or ready without fresh proof.
- Report status explicitly: `DONE`, `DONE_WITH_CONCERNS`, `BLOCKED`, or `NEEDS_CONTEXT`.
- Use this skill to coordinate frontend/backend work, not to duplicate their detailed guidance.
- When a task becomes domain-heavy, stop bloating this transcript and load [`../frontend/SKILL.md`](../frontend/SKILL.md) or [`../backend/SKILL.md`](../backend/SKILL.md).

## Execution Modes

| Scope / Complexity | Default execution model |
|--------------------|-------------------------|
| Small, single proof path | Direct execution |
| Medium, separable concerns | Subagents-driven development |
| Large, cross-domain feature | Team of agents |
| Epic, multi-iteration work | Supervised harness loop |

Read [subagents-and-parallelism.md](./references/subagents-and-parallelism.md) for controller/worker patterns, safe parallelization, and team composition.

## General Workflow Router

### Repo orientation and session hygiene

Read [repo-orientation.md](./references/repo-orientation.md) for startup discovery, repo-shape detection, and initial command selection.

Read [instruction-file-design.md](./references/instruction-file-design.md) when structuring or auditing `AGENTS.md`, `CLAUDE.md`, or other instruction surfaces.

Read [harness-loops.md](./references/harness-loops.md) for repeated agent iterations, disk-backed specs/plans, and builder/reviewer loops.

### Architecture, planning, and execution design

Read [architecture-analysis.md](./references/architecture-analysis.md) when explaining how the system works, tracing dependencies, or evaluating change impact.

Read [architecture-patterns.md](./references/architecture-patterns.md) when choosing or comparing software architecture patterns.

Read [system-design-workflows.md](./references/system-design-workflows.md) when designing a system, migration, API surface, or scaling plan from scratch.

Read [interface-design.md](./references/interface-design.md) when the right module or API shape is unclear and should be explored before implementation.

Read [tech-decision-guide.md](./references/tech-decision-guide.md) when the user needs to choose a technology.

Read [interviewer-pattern.md](./references/interviewer-pattern.md) before any non-trivial creation task where key constraints are still ambiguous.

Read [prd-to-plan.md](./references/prd-to-plan.md) for phased implementation plans and tracer-bullet slicing.

Read [refactor-planning.md](./references/refactor-planning.md) for safe refactor decomposition, commit slicing, and RFC/issue planning.

### Reviews, debugging, and verification

Read [reviews-and-comments.md](./references/reviews-and-comments.md) for code review, PR feedback, and adversarial review passes.

Read [observability.md](./references/observability.md) before adding logs or instrumentation, and whenever debugging should start from existing signals.

Read [specs-plans-tests.md](./references/specs-plans-tests.md) when the workflow needs explicit separation between behavior spec, execution plan, and proof.

Read [verification-and-finish.md](./references/verification-and-finish.md) before declaring success, opening a PR, or cleaning up a branch/worktree.

### Testing and CI workflow

Read [tdd-advanced.md](./references/tdd-advanced.md) for spec-first TDD, property-based testing, mutation testing, and autonomy limits.

Read [tdd-framework-guide.md](./references/tdd-framework-guide.md) when setting up or changing a test framework.

Read [tdd-ci-integration.md](./references/tdd-ci-integration.md) when wiring coverage into CI.

Read [github-actions-templates.md](./references/github-actions-templates.md), [gitlab-ci-templates.md](./references/gitlab-ci-templates.md), and [deployment-gates.md](./references/deployment-gates.md) for baseline CI pipeline generation and deployment gates.

### Agentic systems and LLM workflows

Read [agentic-system-design.md](./references/agentic-system-design.md) when designing agent architectures from scratch.

Read [prompt-engineering-patterns.md](./references/prompt-engineering-patterns.md) when writing or improving prompts.

Read [llm-evaluation-frameworks.md](./references/llm-evaluation-frameworks.md) when evaluating LLM or RAG output quality.

### Git, release, and landing

Read [collaboration-and-git.md](./references/collaboration-and-git.md) for branch and PR workflow.

Read [conventional-commits.md](./references/conventional-commits.md) for commit message standards and release tooling.

Read [release-workflow-comparison.md](./references/release-workflow-comparison.md) when choosing a branching strategy.

Read [hotfix-procedures.md](./references/hotfix-procedures.md) for emergency release flow.

Read [land-and-deploy.md](./references/land-and-deploy.md) when the user asks to merge, land, or deploy.

### Learning and self-improvement

Read [self-improvement.md](./references/self-improvement.md) at session end or after recurring mistakes.

Read [autoimprove.md](./references/autoimprove.md) for autonomous reference optimization.

Read [skill-extraction.md](./references/skill-extraction.md) when session learnings should become a reusable skill.

Read [continual-learning.md](./references/continual-learning.md) to update durable repo/user memory in instruction files.

Read [learning-system.md](./references/learning-system.md) and its companion references when operating the repo-local `learning/` system.

## Domain Routing

This skill should reference the specialized engineering skills repeatedly and intentionally:

- Before frontend implementation, load [`../frontend/SKILL.md`](../frontend/SKILL.md).
- Before backend implementation, load [`../backend/SKILL.md`](../backend/SKILL.md).
- For full-stack features, use this skill as the controller and split the execution across [`../frontend/SKILL.md`](../frontend/SKILL.md) and [`../backend/SKILL.md`](../backend/SKILL.md).
- For UI review or polish after backend work is done, hand off to [`../frontend/SKILL.md`](../frontend/SKILL.md).
- For schema/API/service changes discovered while doing UI work, hand off to [`../backend/SKILL.md`](../backend/SKILL.md).

## Bundled Scripts

- `scripts/repo_scan.py` for repo scanning and startup context.
- `scripts/project_architect.py` for architecture detection and layer violations.
- `scripts/architecture_diagram_generator.py` for Mermaid, PlantUML, or ASCII diagrams.
- `scripts/stack_detector.py` and `scripts/pipeline_generator.py` for baseline CI generation.
- `scripts/coverage_analyzer.py`, `scripts/fixture_generator.py`, and `scripts/tdd_workflow.py` for verification workflows.
- `scripts/prompt_optimizer.py`, `scripts/rag_evaluator.py`, and `scripts/agent_orchestrator.py` for LLM/agent systems work.
- `scripts/init-learning.sh`, `scripts/init-learning.py`, `scripts/capture-item.py`, `scripts/scan-learning.py`, and `scripts/refresh-learning.py` for the learning system.
- Frontend-specific generators and analyzers now live in [`../frontend/scripts/`](../frontend/scripts/).
- Backend-specific API and database tooling now live in [`../backend/scripts/`](../backend/scripts/).

## Standard Loop

1. Orient: inspect repo instructions, architecture, git state, and the current task context.
2. Classify: determine the work type and execution mode.
3. Route: load [`../frontend/SKILL.md`](../frontend/SKILL.md), [`../backend/SKILL.md`](../backend/SKILL.md), or both when domain-specific detail is needed.
4. Anchor: find the existing owner of the behavior and the minimal safe change surface.
5. Implement: make the smallest coherent change that solves the right problem.
6. Verify: run focused proof first, then broader regression evidence.
7. Compound: surface follow-up risks, rollout notes, and cleanup for the next engineer.

## Hooks

This skill ships three hooks. Wire them in Claude Code settings, replacing `/absolute/path/to/agentic-development` with the actual path.

### Completion gate

`hooks/check-completion.sh` blocks premature stopping and forces a final pass over the original request, plan/spec state, verification evidence, recent errors, and integration cleanup.

### Tool logging and error capture

- `hooks/pre-tool.sh` logs every `Bash`, `Write`, and `Edit` invocation to stderr.
- `hooks/post-bash.sh` captures non-zero exit codes into `memory/working/last_error.json`.
- `hooks/session-end.sh` writes `memory/working/session_end.json` so the self-improvement phase can detect a finished session.
