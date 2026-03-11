# Specs, Plans, Tests, and Progress

Do not collapse these ideas into one blob. Each solves a different problem.

## Definitions

- A `spec` defines what must be true when the work is done: user-visible behavior, constraints, acceptance criteria, invariants, and non-goals.
- A `plan` defines how to get there: ordered steps, files likely to change, risks, checkpoints, and verification commands.
- A `progress file` records loop state across iterations: what is done, what failed, and the next highest-priority slice.
- A `test` proves behavior. In TDD, the test fails first, then passes after the minimal fix.

## Structured Spec Shape

The exact template can vary by repo, but a harness-friendly spec should make done-ness and proof explicit. A lightweight frontmatter shape works well:

```yaml
---
title:
scope:
acceptance_criteria:
test_requirements:
constraints:
non_goals:
risks:
---
```

Use the body for behavior details, examples, links, and open decisions.

## When to Use Each

Write or refine a spec when:

- the behavior is unclear
- multiple valid product interpretations exist
- success criteria are missing
- several engineers or agents need a shared contract

Write a plan when:

- the user explicitly asks for a plan
- the repo requires planning before implementation
- the change is large enough that execution order matters
- several agents or sessions must coordinate

Use TDD when:

- fixing a bug with a reproducible symptom
- changing business logic, parsing, data transformation, or policy code
- the repo already has a strong automated test culture
- tests are in scope for the task

Keep a progress file when:

- the work spans multiple sessions or repeated agent iterations
- several slices share one spec but should not share one huge transcript
- a human or reviewer needs to see what remains without rereading chat history

## Default Execution Modes

- Small and clear: implement directly, then verify.
- Fuzzy request: clarify the spec first.
- Explicit planning request: write a plan before code.
- Large multi-step change: define the spec, then write the plan, then execute in checkpoints.
- Bug fix: reproduce, add a failing regression test when tests are in scope, make the minimal fix, then re-run the proof.

## Planning Mode vs Building Mode

Keep planning and building as separate modes when the work is large enough to need iteration.

- Planning mode updates only the spec, plan, or progress artifact.
- Building mode executes one highest-priority task from that artifact, proves it, and writes back the result.

Do not let a single pass half-plan and half-build across a large surface. That is how scope drifts and context bloats.

## Harness-Friendly Task Slices

A good slice fits in one iteration:

- one primary goal
- one clear owner or change surface
- one proof path
- small enough to understand end-to-end without relying on chat memory

If a slice cannot be explained and verified compactly, it is probably too large.

## Do Not Confuse a Plan with a Spec

A list of steps is not a behavior contract. A user story is not an execution recipe. Keep both artifacts distinct so you can tell whether you have a product ambiguity or an implementation ambiguity.

## Test Strategy Notes

- If the repo has a strong test culture, use tests as the main proof.
- If tests are not in scope, say so and use the narrowest non-test proof available.
- For agentic, tool-using, or integration-heavy systems, prefer deterministic stubs, mocks, recordings, or transcript fixtures over relying only on live vendor traffic.

## Repo Policy Overrides

Always respect local policy for planning and tests. Some repos want plans only on explicit request. Some repos do not want tests run automatically. In those repos, state what you verified and what you intentionally did not run.
