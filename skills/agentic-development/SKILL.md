---
name: agentic-development
description: End-to-end repository execution workflow for implementing, debugging, refactoring, reviewing, instrumenting, and shipping code in any software repo. Use when the assistant needs to orient in an unfamiliar codebase, decide how to work safely on main, branches, or worktrees, separate specs from plans from tests, coordinate parallel agents, handle PR and review feedback, inspect observability, or land cross-cutting frontend/backend changes without leaving loose ends.
---

# Agentic Development

Drive work through one loop: orient, classify the task, choose the execution mode, implement, review, verify, and compound. Treat repo-local instructions and existing architecture as the source of truth.

## Start Here

1. Map the repo before touching code: instruction files, package or service boundaries, build and test commands, deployment surfaces, and current git state.
2. Decide the task type: direct implementation, debugging, review, spec clarification, plan execution, refactor, instrumentation, or release cleanup.
3. Choose the authoritative path for the change: the existing module, service, component, hook, page, command, or workflow that already owns the behavior.
4. Decide the proof before editing: what command, test, log, screenshot, or trace will confirm the result.
5. Load only the reference files relevant to the current task.

## Core Rules

- Prefer repo-local instructions over generic advice. If `AGENTS.md`, `CLAUDE.md`, `SOUL.md`, `PRINCIPLES.md`, `PLANS.md`, `README.md`, `CONTRIBUTING.md`, or service/package docs exist, follow them in the hierarchy the repo defines.
- Work with the current git reality. Do not force a branch or worktree change just because `main` is active; choose the safest path that fits the user's intent.
- Extend existing seams. Reuse current services, hooks, stores, component primitives, models, logging, analytics, and scripts instead of creating parallel abstractions.
- Separate concerns intentionally: specs define behavior, plans define execution, tests prove behavior, and instrumentation explains production behavior.
- Verification gates claims. Do not say fixed, complete, passing, or ready without fresh evidence.
- Frontend work is product behavior, not decoration. Preserve design systems, router conventions, state ownership, accessibility, and interaction quality the same way you would preserve API boundaries in a backend.
- Finish cleanly. Make the next integration step explicit instead of silently leaving the repo in an ambiguous state.

## Architecture Bias

Apply these defaults unless the repo clearly prefers something else:

- Maximize reuse and minimize total LOC.
- Prefer one authoritative implementation path over duplicated variants.
- Avoid repeated logic and near-duplicate code with the same purpose.
- Do not over-modularize. Split only when independence, ownership, or readability materially improves.
- Favor cohesive vertical slices over scattering one concept across many files.
- Push business logic and async orchestration out of leaf UI where possible; keep views readable and state ownership explicit.
- Treat loading, empty, error, success, and responsive states as part of the implementation, not post-hoc polish.

## Workflow Router

### Orientation and repo policy

Read [repo-orientation.md](./references/repo-orientation.md) for startup discovery, instruction-file handling, repo-shape detection, and initial command selection.

### Git, branches, worktrees, and PR flow

Read [collaboration-and-git.md](./references/collaboration-and-git.md) when the task touches branching strategy, worktrees, PRs, merges, or cleanup.

### Spec-driven, plan-driven, and test-driven delivery

Read [specs-plans-tests.md](./references/specs-plans-tests.md) when the user asks for a plan or spec, when scope is fuzzy, or when TDD should drive the work.

### Subagents and parallel work

Read [subagents-and-parallelism.md](./references/subagents-and-parallelism.md) for controller and worker patterns, review loops, and safe parallelization.

### Reviews, comments, and PR feedback

Read [reviews-and-comments.md](./references/reviews-and-comments.md) when reviewing code, receiving review feedback, or addressing GitHub, Sentry, or CI comments.

### Observability and debugging

Read [observability.md](./references/observability.md) before adding logs or instrumentation, and whenever debugging should start from existing signals instead of guesswork.

### Backend execution

Read [backend-development.md](./references/backend-development.md) for service-layer, data-model, API, async, and architecture heuristics.

### Frontend execution

Read [frontend-development.md](./references/frontend-development.md) for framework boundary detection, reusable component design, UI implementation, refactor workflow, async UX, accessibility, responsive quality, performance priorities, and analytics.

### Verification and completion

Read [verification-and-finish.md](./references/verification-and-finish.md) before declaring success, opening or merging a PR, or cleaning up a branch or worktree.

## Standard Execution Loop

1. Orient: inspect repo instructions, architecture, git state, and current task context.
2. Classify: decide whether this is implementation, debugging, review, refactor, instrumentation, or release work.
3. Anchor: find the existing owner of the behavior and the minimal safe change surface.
4. Implement: make the smallest coherent change that solves the right problem, not just the nearest symptom.
5. Verify: run the focused proof first, then any broader regression evidence the repo or user expects.
6. Compound: surface follow-up risks, documentation updates, rollout notes, or cleanup the next engineer will need.

## Skill Orchestration

If the current environment exposes more specialized skills, route work through them instead of bloating this skill:

- Use `create-plan` when the user explicitly asks for a plan.
- Use `quality-assurance` when verification strategy, flaky tests, review findings, or CI triage becomes the bottleneck.
- Use `gh-address-comments` for GitHub review-thread triage and inline replies.
- Use `gh-fix-ci` when GitHub Actions checks are failing.
- Use repo-specific frontend, observability, browser-testing, analytics, or release skills when they exist. Otherwise, use the references in this skill.

## Completion Hook

If the host supports stop hooks or pre-finish hooks, wire in [check-completion.sh](./hooks/check-completion.sh). The hook blocks premature stopping and forces a final pass over the original request, plan or spec state, verification evidence, recent errors, and integration cleanup.

Example Claude-style hook registration:

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
