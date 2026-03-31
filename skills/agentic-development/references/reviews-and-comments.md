# Reviews and Comments

Treat review as technical evaluation, not social performance.

## When Performing a Review

Lead with findings, ordered by severity. For each finding, include the file and line, the concrete risk, and why it matters. If no findings are present, say so explicitly and mention any residual testing or verification gaps.

When the output will feed another agent or a loop, prefer a machine-parseable line format:

```text
<category>/<severity> <path>:<line> -- <risk or issue> -> <expected fix>
```

Examples:

```text
correctness/major services/auth.py:42 -- unauthenticated path can bypass guard -> reject request before loading account
testing/minor tests/test_auth.py:18 -- missing regression for empty token -> add failing case and rerun focused test
architecture/major src/payments.ts:77 -- view now owns retry logic that belongs in service layer -> move orchestration behind existing payment client
```

Narrative summary can follow after the findings. Findings come first.

## When Receiving Review Feedback

- Read the feedback completely before changing code.
- Restate unclear requirements in precise technical terms or ask for clarification.
- Verify whether the issue still exists in the current code.
- Push back when the feedback is technically wrong for this repo.
- Implement one area at a time and re-verify.

Do not use performative agreement in place of analysis.

## Review Thread Hygiene

If the review platform supports inline replies, answer in the thread for line-specific comments. Use top-level comments only for cross-cutting discussion.

When fixing comments:

- cluster related comments
- fix blockers first
- re-run the narrowest relevant verification
- reply with the concrete change, not vague reassurance

## Bot Comments

Treat comments from Sentry, static analyzers, or CI bots as triage inputs.

- verify the comment is not stale
- inspect the exact file and line it references
- confirm the root cause before editing
- summarize what changed and what evidence supports the fix

## Adversarial Review

After completing a structured review, dispatch a separate adversarial pass — especially for large diffs. The goal is to find what the structured review missed by taking an independent, adversarial perspective.

### When to run

Scale the depth to the diff size:
- **< 50 lines changed:** skip adversarial review — the structured pass is sufficient.
- **50–199 lines changed:** one adversarial pass (Claude subagent or a separate model if available).
- **200+ lines changed:** full adversarial pass plus a structured review from a second model when available.

### Adversarial subagent prompt

Dispatch via the Agent tool with this prompt (subagent has fresh context — no checklist bias):

> "Read the diff for this branch with `git diff origin/<base>`. Think like an attacker and a chaos engineer. Your job is to find ways this code will fail in production. Look for: edge cases, race conditions, security holes, resource leaks, failure modes, silent data corruption, logic errors that produce wrong results silently, error handling that swallows failures, and trust boundary violations. Be adversarial. Be thorough. No compliments — just the problems. For each finding, classify as FIXABLE (you know how to fix it) or INVESTIGATE (needs human judgment)."

**FIXABLE findings** flow into the Fix-First pipeline: fix them, commit, re-run tests.
**INVESTIGATE findings** are presented as informational — the developer decides.

### Multi-model synthesis

When more than one source ran (structured review + adversarial subagent + another model):

```
ADVERSARIAL REVIEW SYNTHESIS:
════════════════════════════════════════════════════════════
  High confidence (found by multiple sources): [agreed findings]
  Unique to structured review: [...]
  Unique to adversarial pass: [...]
════════════════════════════════════════════════════════════
```

High-confidence findings (agreed on by multiple sources) get priority treatment.

---

## GitHub Helpers

If the repo exposes `gh-address-comments`, use it for comment triage. If CI is failing, use `gh-fix-ci` to inspect the checks before you start guessing at fixes.
