# Harness Engineering

Use this reference when the user asks to improve agent autonomy, audit repo readiness for coding agents, reduce repeated agent mistakes, or turn documented conventions into enforceable feedback loops.

Core idea: humans steer, agents execute. When an agent fails, do not default to "try harder." Ask what capability, context, enforcement, or feedback loop is missing, then encode that improvement in the repository.

## Audit Dimensions

Score the repo against these dimensions before prescribing changes:

| Dimension | What good looks like |
|---|---|
| Context architecture | Root `AGENTS.md`/`CLAUDE.md` is a short map, roughly 100 lines, pointing to versioned docs instead of embedding a manual. |
| Subsystem guidance | High-risk areas have local `AGENTS.md`, `ARCHITECTURE.md`, or README files with protocols, invariants, anti-patterns, debug steps, and required skills. |
| Mechanical enforcement | Layer boundaries, file size, naming, logging, schema validation, doc links, and tool-spec completeness are checked by linters, structural tests, or CI. |
| CI feedback | Feature-branch CI runs the checks agents need: lint, typecheck, tests, build, cycles/import boundaries, i18n/schema checks, and machine-readable failure output. |
| Tests and evals | Unit/integration/e2e tests cover code behavior; evals cover agent behavior, tool-call quality, golden interactions, and review quality. |
| Observability | Logs, metrics, traces, DOM snapshots, screenshots, and runtime errors are queryable by agents with stable correlation ids. |
| Persistent knowledge | Research, lessons, regressions, friction, plans, and runbooks live in repo-local docs and are updated after non-obvious fixes or repeated mistakes. |
| Continuous quality | Background or scheduled tasks scan for drift, stale docs, oversized files, missing tests, architecture violations, and small refactoring opportunities. |
| Agent legibility | Tools, schemas, errors, command output, and docs are boring, structured, inspectable, and easy for agents to validate directly. |

## Fast Audit Procedure

1. Run `python <skill-dir>/scripts/repo_scan.py <repo-root>`.
2. Run `python <skill-dir>/scripts/harness_audit.py <repo-root>` for a first-pass readiness report.
3. Read the root instruction file and only the referenced docs that govern the target area.
4. Inspect CI workflows and local verify commands. Identify which important checks exist but are not wired into CI.
5. Inspect high-risk subsystem folders for local guidance and tests.
6. Produce findings as P0/P1/P2 items, with file paths and concrete enforcement proposals.

Use the script as evidence, not as authority. Confirm important claims by reading the relevant files.

## Improvement Patterns

### 1. AGENTS.md as Map

Keep always-loaded instruction files short and operational:

```markdown
# Project Agent Map

## Objective
[One paragraph: what the repo builds and how agents should work.]

## Required Reading
- Backend architecture: docs/references/backend-architecture.md
- Testing: docs/references/testing.md
- CI: docs/references/ci.md
- Product context: docs/references/product-context.md

## Commands
- Setup: ...
- Verify: ...

## Boundaries
- Always: ...
- Ask: ...
- Never: ...
```

Move detailed command lists, architecture guides, style rules, serializer patterns, logging policy, and workflow manuals into referenced files. Add a CI check that every referenced doc path exists.

### 2. Subsystem AGENTS.md

Add local guidance where inference is risky: auth/session, AI/streaming, realtime/websocket, conversation/chat, canvas/collaboration, API transport, worker queues, billing, security-sensitive services, and shared component systems.

Template:

```markdown
# [Subsystem] Agent Guide

## Interface / Protocol
[Inputs, outputs, state machine, callbacks, request format.]

## Critical Rules
- ...

## Anti-Patterns
- Bad: ...
- Good: ...

## Debugging
- Logs/traces/flags/tools to inspect.

## Required Skills
- ../path/to/relevant/skill

## Living Update Protocol
Update this file when repeated work exposes a missing invariant.
```

### 3. Enforce Architecture

Promote repeated review comments into checks:

- Structural tests for import direction and forbidden dependencies.
- ESLint boundaries, import-linter, custom AST checks, or repo-specific scripts.
- File-size warnings near 200 lines and hard gates near 500 lines where the repo agrees.
- Logging and error-shape checks for service boundaries and `except`/`catch` blocks.
- Schema/type validation at external boundaries.
- Tool-spec completeness checks for agent-callable tools.

Documentation can describe the rule; CI should reject or report the violation.

### 4. Close CI Feedback Loops

Feature branches are where agents work, so they need fast signals there:

- lint, typecheck, focused tests, and build where cost allows
- circular dependency or import-boundary checks
- i18n/schema/generated-artifact checks
- migration drift checks for backend repos
- coverage thresholds scoped to high-risk agent/harness code before legacy global thresholds
- structured failure output with path, line, rule, and remediation hint

Prefer minimal blocking gates plus high-signal warnings over slow, noisy pipelines.

### 5. Add Evals for Agent Behavior

Tests prove code; evals prove agent-facing behavior. Start with a small golden set:

- prompt -> expected tool call sequence -> expected response envelope
- harness behavior: timeout, stall detection, semantic loop detection, HITL escalation
- review behavior: known good PRs and expected P0/P1 findings
- frontend journeys: DOM/screenshot before and after key user paths

Run expensive evals on schedules or when prompts/tool specs/harness config changes.

### 6. Make Observability Agent-Legible

Expose the signals agents need to debug without a human:

- query tools or runbooks for logs, metrics, traces, Sentry, and deployment events
- stable request/run/thread/trace ids across logs and spans
- frontend debug flags with consistent tags and request ids
- worktree-local app instances with isolated DB/cache namespaces when possible
- browser/DOM/screenshot workflows for UI reproduction and validation

Agents should be able to answer "what failed, where, and after which change?" from repo tools and documented commands.

### 7. Persist Learning on Disk

Use repo-local files, not chat history, as the system of record:

- `docs/research/YYYY-MM-DD-topic.md` for subsystem investigations
- `docs/lessons/YYYY-MM-DD-topic.md` for repeated mistakes or non-obvious fixes
- `REGRESSIONS.md` and `FRICTION.md` only if they are populated and maintained
- `docs/runbooks/agent-debugging.md` for common diagnostic paths
- `docs/references/product-context.md` when product docs are external or symlinked outside the repo

At session end, ask whether a finding should become a lesson, an instruction update, or a mechanical check.

### 8. Continuous Quality

Replace large cleanup pushes with recurring small maintenance:

- doc-gardening tasks that find stale links and docs mismatched to code
- architecture drift scans that open issues or PRs
- oversized-file reports
- missing-test or missing-eval reports for changed critical paths
- quality score documents by product domain or architectural layer

Prefer small, reviewable, automatable PRs over broad refactors.

## Prioritization

Use this order unless the repo has a more urgent production risk:

1. P0: shrink monolithic always-loaded instructions into a map.
2. P1: wire existing checks into CI and add structural boundary tests for the most important layer rule.
3. P1: add subsystem `AGENTS.md` files for the riskiest undocumented areas.
4. P1: add initial evals for agent/harness behavior.
5. P2: expose logs, metrics, traces, and runtime errors through agent-readable tools or runbooks.
6. P2: establish research, lessons, and session-end protocols.
7. P2: add background doc-gardening and architecture drift checks.

## Finish Criteria

A harness improvement is not done until:

- the repo can explain the new rule through a short map or local subsystem doc
- the rule is enforced by a command, lint, test, CI job, hook, or scheduled check when enforcement is practical
- the verification command has been run or the unrun command is named
- any follow-up that cannot be automated is captured in a plan, issue, or documented risk
