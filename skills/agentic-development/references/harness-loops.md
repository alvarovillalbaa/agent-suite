# Harness Loops

A harness loop is not "let the agent run forever." It is supervised repeated execution with fresh context, disk-backed state, and hard backpressure.

Use it when iteration helps throughput. Do not use it as a substitute for missing specs, weak verification, or human judgment.

## Use Harness Mode When

- the work can be reduced to one independently provable task at a time
- a spec, checklist, or prioritized progress file already exists on disk
- the repo has reliable commands for lint, typecheck, tests, build, or equivalent checks
- the change can run in an isolated branch, worktree, sandbox, or ephemeral environment
- a human supervisor can inspect outcomes and stop, rescope, or tighten the guardrails

## Avoid Harness Mode When

- product behavior is still ambiguous
- the next step depends on new human judgment every iteration
- the gates are noisy, warn-only, flaky, or missing
- the task changes secrets, auth, infra, migrations, or destructive operations without explicit approval
- multiple loops would race on the same files, generated artifacts, or deployment target

## Persistent Artifacts

Keep state on disk, not in a huge running transcript.

Useful artifacts:

- a short spec with acceptance criteria and test requirements
- a plan when the repo or user wants one
- a progress file or implementation checklist that tracks the next highest-priority item
- structured review findings for the next iteration

Prefer a compact index that points to deeper docs over pasting full reference material into every loop.

## Loop Recipe

1. Orient once: map instructions, ownership, commands, and git state.
2. Choose one task: pick the single highest-priority item that can be finished and proven in one iteration.
3. Start fresh: begin the iteration with the minimum context needed, usually a short prompt plus pointers to the spec and progress file.
4. Implement narrowly: change only the files required for that one task.
5. Run the proof chain: focused check first, broader gates second if the touched surface justifies them.
6. Record state: update the progress file with what passed, what failed, and what remains next.
7. Review separately: run a reviewer pass or separate agent brief before treating the slice as done.
8. Let the human decide: the supervisor chooses whether to continue, merge, rescope, or stop.

## Context Economy

- Keep always-loaded instruction files terse and operational.
- Use index files, spec summaries, or short task lists to pin context.
- Load detailed references only when a loop actually needs them.
- Prefer quiet commands and focused scopes.
- Shape test or log output so the loop sees failures and decision-useful lines, not pages of passing noise.

## Hard Backpressure

Gates that decide progress must be pass or fail.

- Warn-only gates can inform humans, but they cannot produce a false green.
- If a repo has no single local verify command, chain the minimum relevant commands explicitly.
- If a gate is unreliable, either harden it before relying on harness mode or mark it non-gating and keep a human in charge.

Repeated flailing usually means one of three things: the task is too large, the spec is weak, or the verification output is too noisy.

## Builder and Reviewer Separation

Builder and reviewer should not share the same brief.

- Builder context: task slice, existing implementation patterns, likely files, and proof commands.
- Reviewer context: acceptance criteria, rejection criteria, verification expectations, and output format.

The reviewer should emit findings or an explicit pass, not silently rewrite the task definition.

For machine-consumable review output, use the structured format described in [reviews-and-comments.md](./reviews-and-comments.md).

## Security and Blast Radius

If harness mode needs broad permissions:

- prefer an isolated or ephemeral environment over a personal workstation
- provide the least privilege secrets needed for the task
- avoid access to private datasets unless the task truly requires them
- assume compromise is possible and shrink the blast radius accordingly

## When to Exit Harness Mode

Switch back to direct execution or a human-led planning pass when:

- the same failure repeats without new information
- the task keeps spilling across unrelated files
- the reviewer keeps finding spec-level ambiguity
- the environment or gates are not trustworthy enough to keep looping
