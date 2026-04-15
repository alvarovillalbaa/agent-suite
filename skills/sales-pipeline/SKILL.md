---
name: sales-pipeline
description: Sales pipeline skill for CRM hygiene, stage review, deal inspection, forecast calls, pipeline coverage analysis, and next-best actions. Use when the user has pipeline exports, CRM notes, or deal lists and needs a structured view of deal health, forecast confidence, stage bottlenecks, stale opportunities, and concrete actions to improve pipeline quality or conversion.
metadata:
  short-description: Inspect pipeline health, forecast, and deal actions
---

# Sales Pipeline

Turn pipeline data into a view of what is real, what is at risk, and what should happen next.

## Use this skill for

- pipeline health reviews
- weekly forecast calls
- deal inspection and next-step planning
- CRM cleanup and stage hygiene
- coverage and conversion analysis
- diagnosing why opportunities are stalling or slipping

## Core model

Analyze pipeline at three levels:

- **Pipeline level**: coverage, stage mix, aging, conversion, forecast confidence
- **Stage level**: bottlenecks, drop-off, cycle time, definition drift
- **Deal level**: champion, pain, timeline, next step, risk, and close realism

## Default output structure

### 1. Pipeline snapshot

- total pipeline
- pipeline by stage
- pipeline by close period
- coverage versus target if available

### 2. Forecast view

- committed
- best case
- upside
- excluded or unforecastable pipeline

For each bucket, explain why the confidence level is justified.

### 3. Stage health

- volume by stage
- average age in stage
- stale opportunities
- conversion or exit pattern
- where stage definitions appear weak or inconsistently applied

### 4. Deal risks

- top deals at risk
- slip risk
- missing next step
- missing buying signal, champion, budget, or decision path

### 5. Recommended actions

- pipeline cleanup
- deal-level action
- manager inspection point
- process fix

## Forecast rules

- Separate pipeline amount from forecast confidence.
- Do not let CRM stage alone determine forecast category.
- Flag any deal with no dated next step as low confidence.
- Flag stale deals explicitly; do not leave them hidden in stage totals.
- Name what evidence would move a deal up or down in confidence.

## Default hygiene checks

Run these checks even if the user does not ask for them explicitly:

- missing next meeting or next action
- close date in the past
- opportunity aged beyond normal for its stage
- no recent activity
- stage does not match note history
- no identified champion or decision maker
- no clear reason to buy now

## Stage logic

If the user does not supply stage definitions, infer a simple progression such as:

- discovery
- qualification
- evaluation
- proposal
- negotiation
- closed won or lost

Then state that the stage model was inferred.

## Failure modes to avoid

- optimistic forecast unsupported by evidence
- summarizing stage totals without inspecting deal quality
- confusing activity with progress
- leaving stale deals inside headline numbers
- recommending actions that are too generic to execute

## Quality bar

- Forecast buckets are evidence-based.
- Stale or weak deals are visible.
- Recommended actions map to specific deals, stages, or process problems.
- The user can leave the review knowing what to clean, what to push, and what not to trust.
