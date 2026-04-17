---
name: pr-management
description: "Pull request management skill for teams from 1 to 1000+ engineers. Use when the user needs to design or improve PR workflow, review queues, merge policy, ownership rules, branch strategy, review SLAs, CI gating, metrics, or operating rituals for getting code reviewed and merged safely at scale."
metadata:
  short-description: Manage PR flow, review queues, and merge policy
---

# PR Management

Use this skill for pull request operations and process design across an engineering team.

## Use this skill for

- defining PR workflow and merge policy
- improving review throughput and queue health
- reducing PR size, review latency, or merge risk
- setting ownership, routing, and reviewer expectations
- designing branch strategy and release interaction with PR flow
- building PR metrics, dashboards, and operating reviews
- diagnosing why reviews stall, churn, or pile up

## Core model

Manage pull requests at four levels:

- **PR level**: size, clarity, test evidence, risk, reviewability
- **Reviewer level**: ownership, load, response time, quality bar
- **Queue level**: backlog, aging, bottlenecks, merge throughput
- **System level**: policy, CI gates, branching, release cadence, accountability

If the user only wants one level, still check whether the adjacent level is causing the problem.

## Standard output structure

Unless the user asks for a different artifact, produce:

### 1. Current state

- what the existing PR flow is
- where delay or risk shows up
- what team scale or topology matters

### 2. Problem diagnosis

- review latency
- oversized PRs
- unclear ownership
- flaky or slow CI
- merge conflicts or release friction
- approval quality or rubber-stamping

### 3. Recommended operating model

- author expectations
- reviewer expectations
- merge rules
- escalation path
- exceptions policy

### 4. Metrics

- what to measure
- target threshold or SLA
- what action to take when a metric goes out of bounds

### 5. Rollout plan

- immediate changes
- policy changes
- tooling or automation needs
- communication and adoption steps

### 6. Risks and tradeoffs

- what improves
- what gets stricter or slower
- where the process may overfit team size or repo shape

## Recommended metrics

Prefer a small set of operationally useful metrics:

- time to first review
- time to approval
- time to merge
- PR size by lines changed or files touched
- rework loops per PR
- review queue age
- CI failure rate
- merge-blocked count

Do not stop at reporting. Pair every metric with an action threshold.

## Default policy components

When the user asks for a PR process and does not supply one, cover these defaults:

- PR description must explain why, not only what changed
- PRs should be small enough to review in one sitting
- authors own test evidence and rollout notes
- reviewer assignment should follow clear ownership or rotation
- stale PRs need explicit nudges or escalation
- CI gates should block merge on correctness, not on noise
- emergency paths should exist but be auditable

## Team-scale guidance

Adjust the workflow by scale:

- **1-10 engineers**: favor lightweight rules, high trust, fast merge, minimal ceremony
- **10-50 engineers**: add reviewer routing, SLA expectations, and better queue visibility
- **50-200 engineers**: formalize ownership, exceptions, merge policy, and reporting
- **200-1000+ engineers**: treat PR management as an operational system with dashboards, automation, and explicit governance

Do not recommend enterprise-heavy policy for a tiny team unless the user explicitly wants it.

## Diagnosis heuristics

If PRs are slow:

- inspect PR size first
- then reviewer load
- then CI duration and flakiness
- then ownership ambiguity

If review quality is weak:

- inspect incentives and expectations
- inspect whether reviewers have context and authority
- inspect whether PRs are too large to review properly

If merge risk is high:

- inspect test gates
- inspect branch age and merge frequency
- inspect release coupling and hotfix paths

## Failure modes to avoid

- solving queue problems with only more reminders
- adding approval layers without fixing ownership
- strict policy that collapses under exceptions
- measuring throughput without measuring merge quality
- forcing tiny-team process onto large organizations or vice versa
- treating CI pain as a people problem

## Quality bar

- The workflow is explicit enough to run.
- The metrics are tied to decisions, not vanity.
- Tradeoffs are named clearly.
- The recommendation fits the team size and repo reality.
