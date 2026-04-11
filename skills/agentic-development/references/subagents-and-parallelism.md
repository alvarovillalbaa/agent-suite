# Subagents and Parallelism

Use subagents to improve focus, not to outsource thinking. The controller remains responsible for scope, integration, and truthfulness.

## Complexity Routing Matrix

Pick the execution model before writing any code.

| Complexity signal | Model | Team composition |
|-------------------|-------|-----------------|
| Single file, clear spec, one proof path | **Single agent** | Just you |
| 2–5 files, separable concerns | **Subagents-driven** | Controller + 2–3 focused workers |
| Cross-cutting feature, multi-service | **Team of agents** | Controller + architect + implementer(s) + reviewer |
| Multi-sprint rewrite or major migration | **Supervised harness loop + team** | Persistent controller, fresh agents per iteration |

When the task expands mid-execution — more files touched than planned, unexpected coupling discovered, spec gaps appearing — pause, re-scope, and re-dispatch at the higher tier. Do not keep accumulating context in a single agent.

## Team-of-Agents Patterns

### Standard Feature Team

For a new feature spanning multiple domains:

```
Controller
├── Architect agent     → reads codebase, produces change plan and interface contracts
├── Backend agent       → implements server-side slice per contracts
├── Frontend agent      → implements UI slice per contracts
└── Reviewer agent      → independent spec + risk review of combined diff
```

Controller integrates outputs, resolves conflicts, and runs the final verification gate.

### Investigation Team

For debugging an unknown failure:

```
Controller
├── Log/trace agent     → inspects observability signals and CI output
├── Code-path agent     → traces the execution path through source
└── Hypothesis agent    → synthesizes findings, proposes root cause and fix
```

Controller evaluates hypotheses, picks one, dispatches a fix, and owns the verification.

### Review-Loop Team

For changes where quality matters more than speed:

```
Controller
├── Implementer agent   → writes code
├── Spec reviewer       → checks implementation against acceptance criteria
└── Risk reviewer       → flags security, performance, and regression risks
```

Neither reviewer "self-reviews" — they receive the diff cold, without implementation context.

### Harness Team (long-running work)

For backlog-style or multi-iteration tasks:

```
Controller (persists across iterations, writes state to disk)
└── Per-iteration: fresh agent with: spec slice + current state file + acceptance criteria
```

Each iteration produces either DONE, DONE_WITH_CONCERNS, BLOCKED, or NEEDS_CONTEXT. The controller reads that output and decides the next action.

## Good Reasons to Split Work

- backend and frontend changes are largely independent
- several failures live in unrelated files or subsystems
- a role split helps quality: implementer, spec reviewer, code reviewer
- the repo is large enough that parallel exploration saves time

## Bad Reasons to Split Work

- the tasks edit the same files
- one fix changes the assumptions of the others
- you have not yet understood the architecture
- the prompt to the subagent would just be “figure it out”

## Human on the Loop

Do not let the worker decide the overall strategy.

- the controller chooses when to continue, stop, or rescope
- the controller decides whether a failure means “fix again” or “task definition was wrong”
- the controller owns the blast radius when permissions, secrets, or destructive actions are involved

## Controller Responsibilities

Before dispatching, provide each subagent:

- the exact scope
- the acceptance criteria or spec excerpt
- relevant files and commands
- constraints such as “do not touch unrelated files”
- the format of the expected result

After dispatching:

- review what came back
- check for overlapping edits
- verify claims independently
- integrate in a deterministic order

## Builder and Reviewer Split

When quality matters more than raw speed, split implementation from review.

- builder brief: task slice, existing patterns, relevant files, and verification commands
- reviewer brief: spec excerpt, rejection criteria, verification expectations, and expected findings format

The reviewer should return either explicit findings or an explicit pass. Do not blur those roles into one vague “take a look” prompt.

## Parallel Investigation Pattern

Parallelize exploration when the domains are independent. Typical split:

- one agent maps architecture
- one agent inspects tests or failure modes
- one agent inspects observability or CI logs

Parallelize implementation only when the agents will not race on shared files or shared generated artifacts.

## Review Loops

For large tasks, a strong pattern is:

1. implementer agent
2. spec or behavior review
3. code quality or risk review
4. controller integrates and verifies

Do not let “self-review” replace independent review.

## Skill Routing

If local skills exist, use them as specialists. Typical combinations:

- `create-plan` for formal planning
- `architecture-advisor` for mapping dependencies
- `test-assistant` for tests
- `gh-address-comments` or `gh-fix-ci` for GitHub workflows
- frontend-specific design or refactor skills when the task is UI-heavy
