---
name: fundraising
description: Turn fundraising data (decks, models, emails, CRM notes) into investor-ready messaging, materials upgrade reports, process diagnostics, and speed-up plans. Use when preparing for investor conversations, improving pitch materials, or analyzing fundraising pipeline and bottlenecks.
version: 1.0.0
license: MIT
compatibility: Instruction-only. Optional tools for file read/write.
---

# Fundraising Skill

## Overview

Turn every scrap of fundraising data—decks, models, e-mails, CRM notes—into sharper investor conversations, stronger materials, tighter process analytics, and faster closes. Outputs are structured into five sections: Investor-Ready Messaging, Materials Upgrade Report, Process Diagnostics, Speed-Up Plan, and Quick Wins & Risks.

## When to Use

- User asks to improve pitch deck, financial model, or data room.
- User wants investor messaging or FAQ rebuttals.
- User needs pipeline diagnostics or speed-up plan for a raise.
- User is preparing for investor conversations or analyzing bottlenecks.

## Inputs Required

- **Primary:** Pitch deck (PDF/PPTX), financial model (XLSX/CSV), data room summary, or CRM/pipeline snapshot (PDF, PPTX, XLSX, CSV, DOCX, or raw text).
- **Optional:** Named investors to tailor hooks; stage (seed, A, B); target close date; currency (normalise to one, e.g. EUR or USD).

## Outputs Produced

- **Structured report** with five sections matching `templates/materials-upgrade-report.md` and the structure in Core Process below.
- **Optional JSON** for Speed-Up Plan conforming to `templates/speed-up-plan.json`.
- A clear **checklist of gaps** if inputs are missing; suggest what to add.

## Tooling Rule

- Use Read/Write to load deck, model, or CRM artifacts and to save the report.
- If a schema validator is added under `scripts/`, run it post-generation and reject if required sections are missing.
- Prefer citing sources inline (e.g. `[Source:Slide5]`); mark estimates with `(est.)`.

## Core Process

### 1. Gather inputs

- Locate or ask for: pitch deck, financial model, data room summary, or pipeline/CRM snapshot.
- Normalise dates to YYYY-MM-DD and currency (e.g. EUR) across all inputs.
- If data is missing, note gaps and still produce the five sections with placeholders where needed.

### 2. Produce Investor-Ready Messaging

- **Core Narrative (≤50 words):** Why now, why us. Use `references/investor-messaging-frameworks.md` for structure.
- **Tailored Hooks:** 1-line pitch variants for up to 3 named investors.
- **FAQ Rebuttals:** Top 5 questions and concise answers with data cites. Mark estimates with `(est.)`.

### 3. Produce Materials Upgrade Report

- Table: Asset (Pitch Deck, Financial Model, Data Room) | Strength (0–10) | Gap | Next Action.
- **Priority Fix List:** Rank gaps by investor impact, then effort. Use format in `templates/materials-upgrade-report.md`.
- Every gap must map to a "Next Action" with owner and due date; use "Next:" prefix.

### 4. Produce Process Diagnostics

- **Pipeline Snapshot:** # investors per stage, avg. days in stage, win rate.
- **Bottlenecks:** Stage with highest drop-off and root cause.
- **Metric Benchmarks:** Compare to top-quartile SaaS at your stage using `references/process-benchmarks.md`.

### 5. Produce Speed-Up Plan

- **Critical Path Timeline:** Outreach → first meetings → term sheet → close (target dates).
- **Time Savers:** Up to 3 automations or templates to remove manual steps.
- **Accountability Matrix:** Who owns each next step. Optional: output JSON per `templates/speed-up-plan.json`.

### 6. Produce Quick Wins & Risks

- **Quick Wins (≤3):** Moves the user can execute this week for outsized impact.
- **Top 3 Risks:** With mitigation playbook.

### 7. Close with reflection

- End with: *Reflection »* _Which single action will compress our close date the most?_

## Using Supporting Resources

| Resource | Path | Purpose |
|----------|------|---------|
| References index | `references.md` | Points to all reference files |
| Investor messaging | `references/investor-messaging-frameworks.md` | Core narrative, hooks, FAQ structure |
| Process benchmarks | `references/process-benchmarks.md` | Stage duration and pipeline health reference |
| Materials report template | `templates/materials-upgrade-report.md` | Table and priority-fix format |
| Speed-up plan schema | `templates/speed-up-plan.json` | JSON structure for timeline and accountability |
| Example output | `examples/fundraise-output-example.md` | Example excerpt of full output |

## Example Workflow

**User:** "I have our pitch deck and model here; we're raising a Series A. Give me investor messaging and a materials upgrade report."

1. Read deck and model (or ask for paths).
2. Produce Core Narrative, Tailored Hooks (ask for 1–3 investor names if not provided), FAQ Rebuttals.
3. Score Pitch Deck and Financial Model (0–10), list gaps and Next Actions.
4. Produce Priority Fix List with owner and due date.
5. If pipeline data is provided, add Process Diagnostics and Speed-Up Plan; otherwise note "Add pipeline/CRM for process section."
6. Add Quick Wins & Risks and the reflection question.
7. Deliver the five sections; offer to iterate (e.g. "add a slide," "refine narrative").

## Next Steps After Fundraising

- Run **financial-manager** agent for full finance flow (reconciliation, modeling, fundraising).
- Re-run this skill with new or updated inputs as materials, model assumptions, or pipeline data change.
- Share the Materials Upgrade Report with the team and assign owners from the Accountability Matrix.

## Validation checklist

- [ ] All five sections present (Investor Messaging, Materials Report, Process Diagnostics, Speed-Up Plan, Quick Wins & Risks).
- [ ] Every gap has a Next Action with owner and due date.
- [ ] Scores (0–10) for Material Readiness / Process Efficiency; any score ≤4 or ≥9 has one-line justification.
- [ ] Dates in YYYY-MM-DD; currency normalised; sources cited inline; estimates marked `(est.)`.
- [ ] Reflection question at the end.
- [ ] No section exceeds ~200 words; bullets preferred over long prose.

## Legal disclaimer

This skill provides guidance based on common fundraising best practices and benchmarks; it is **not** legal, tax, or financial advice. Always consult qualified advisors for term sheets, cap table, and compliance. Jurisdictions differ; investor conversations may be subject to securities regulations.
