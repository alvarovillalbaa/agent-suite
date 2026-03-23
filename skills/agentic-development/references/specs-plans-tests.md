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

## Test-Driven Development

TDD is the default delivery mode for any behavioral change. Violating the letter of the rules violates the spirit.

### Iron Law

```
NO PRODUCTION CODE WITHOUT A FAILING TEST FIRST
```

Code written before its test must be deleted and rewritten from tests. No exceptions: do not keep it as reference, do not adapt it while writing tests. Delete means delete.

### When TDD applies

**Always:** new features, bug fixes, refactoring, behavior changes.

**Ask the user:** throwaway prototypes, generated scaffolding, configuration files.

Thinking "skip TDD just this once"? That is rationalization.

### Red-Green-Refactor

**RED — Write one failing test**

Write one minimal test showing what should happen. Clear name, tests real behavior, one thing. Run it and confirm it fails because the feature is missing, not due to a typo.

```bash
npm test path/to/test.test.ts  # confirm fails for expected reason
```

If the test passes immediately, it is testing existing behavior — fix the test.

**GREEN — Write minimal code to pass**

Write the simplest code that makes the test pass. Do not add features, refactor other code, or generalize beyond what the test requires. YAGNI.

Verify: run the test suite and confirm the new test passes and no other tests broke.

**REFACTOR — Clean up under green**

After all tests are green: remove duplication, improve names, extract helpers. Keep tests green. Do not add behavior.

**Repeat** with the next failing test for the next behavior slice.

### Bug Fix Pattern

1. Write a failing test that reproduces the bug.
2. Confirm it fails for the right reason.
3. Fix the root cause (not just the symptom).
4. Verify the regression test and full suite pass.

Never fix a bug without a test.

### Pre-Completion Checklist

Before marking work complete:

- [ ] Every new function or method has a test written before the implementation
- [ ] Watched each test fail before implementing
- [ ] Each test failed for the expected reason (feature missing, not a typo)
- [ ] Wrote minimal code to pass each test
- [ ] All tests pass
- [ ] Output is clean (no errors or unexpected warnings)
- [ ] Tests use real code (mocks only where unavoidable)
- [ ] Edge cases and error paths are covered

Cannot check all boxes? TDD was skipped. Start over.

### Common Rationalizations

| Excuse | Reality |
|--------|---------|
| "Too simple to test" | Simple code breaks. Test takes 30 seconds. |
| "I'll write tests after to verify it works" | Tests written after code pass immediately; you never see them catch the bug. |
| "Tests after achieve the same goals" | Tests-after answer "what does this do?" Tests-first answer "what should this do?" |
| "Already manually tested all edge cases" | No record, can't re-run, easy to forget under pressure. |
| "Deleting X hours of work is wasteful" | Sunk cost. Keeping unverified code is technical debt. |
| "Need to explore first" | Fine. Throw away the exploration code, then start with TDD. |
| "TDD will slow me down" | TDD is faster than debugging production failures. |

### Testing Anti-Patterns

When writing mocks or test utilities, read `testing-anti-patterns.md` in the `quality-assurance` skill to avoid: testing mock behavior instead of real behavior, adding test-only methods to production classes, mocking without understanding dependency chains, and incomplete mocks that hide structural assumptions.

## Test Strategy Notes

- If the repo has a strong test culture, use tests as the main proof.
- If tests are not in scope, say so and use the narrowest non-test proof available.
- For agentic, tool-using, or integration-heavy systems, prefer deterministic stubs, mocks, recordings, or transcript fixtures over relying only on live vendor traffic.

## Repo Policy Overrides

Always respect local policy for planning and tests. Some repos want plans only on explicit request. Some repos do not want tests run automatically. In those repos, state what you verified and what you intentionally did not run.
