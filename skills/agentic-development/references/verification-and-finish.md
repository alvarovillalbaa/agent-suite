# Verification and Finish

Do not claim success without evidence. If you did not run the command that proves the claim, say what you did verify and what remains unverified.

## Binary Gates

If a gate is allowed to block or advance work, it must be binary pass or fail.

- lint, typecheck, test, build, schema, or review gates cannot be treated as “close enough”
- warn-only output can inform a human, but it cannot justify “ready” in a looped or autonomous flow
- if a repo lacks a single local verify command, chain the minimum relevant commands explicitly

Weak or noisy gates cause false green results. Do not hide that.

## Verification Ladder

Use the narrowest checks that prove the current claim:

1. reproduce the bug or failing behavior
2. run the focused test, lint, build, or manual scenario that proves the fix
3. inspect the diff for unintended spillover
4. inspect `git status` before finishing

If the change touched shared infrastructure, core types, public APIs, or other high-fanout seams, run the next broader relevant check before declaring completion.

## Verification Output Hygiene

Prefer output that is useful for decisions:

- use quiet or focused flags when available
- prefer failure-first output over pages of passing logs
- keep screenshots, traces, and manual test notes tied to the exact acceptance criterion they prove

If the repo or user says not to run tests automatically, respect that and state it plainly.

## Before Declaring Completion

- re-read the user request
- confirm each acceptance criterion
- state the verification evidence
- call out anything you could not run
- mention any remaining risk or follow-up

## Finishing a Branch or Worktree

When implementation is complete on a non-main branch, present explicit next-step options instead of guessing:

1. merge locally into the base branch
2. push and create or update a pull request
3. keep the branch or worktree as-is
4. discard the work

Require explicit confirmation before destructive cleanup. If the task lives in a worktree, remove it only when the chosen option makes cleanup safe and intentional.

## Finishing on `main`

If the user kept you on `main`, do not commit or push unless they asked. Summarize the diff, the evidence, and the current git state so the next action is explicit.

## Use the Hook

If the host supports it, register `hooks/check-completion.sh`. The hook exists to catch the classic failure mode: stopping after partial implementation, stale verification, or unfinished integration work.
