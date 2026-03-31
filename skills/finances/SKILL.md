---
name: finances
description: Unified finance skill covering three domains: (1) Accounting reconciliation — reconcile bank statements, movements, and ledgers; map PDF statements to structured rows (XLSX); link receipts to line items. (2) Financial modeling — build, review, or extend financial models (P&L, cash flow, cap table, scenario analysis). (3) Fundraising — turn fundraising data (decks, models, emails, CRM notes) into investor-ready messaging, materials upgrade reports, process diagnostics, and speed-up plans. Use for any finance, reconciliation, modeling, or fundraising task.
version: 1.0.0
license: MIT
compatibility: Instruction-only. Optional tools for file read/write (Excel, CSV, PDF).
---

# Finances Skill

Unified skill covering accounting reconciliation, financial modeling, and fundraising.

---

## Part 1 — Accounting Reconciliation

Reconcile bank movements, statements, and receipts into structured, auditable line items.

### Purpose

- Turn **bank movement statements (PDF)** into **XLSX row items** with consistent date, amount, description, and category.
- Map **receipts** to upload locations (e.g. Drive) and **link them to XLSX row items** for audit trail.
- Flag **discrepancies** between statements and ledger or between multiple sources.

### Inputs

- Bank statements (PDF), CSV/Excel exports, or raw transaction lists.
- Receipts (scans, photos, or paths) and desired storage (e.g. Drive folder).
- Optional: chart of accounts, category mapping, date range, currency (default €).

### Outputs

- Structured rows (e.g. XLSX/CSV) with: date (YYYY-MM-DD), amount, description, category, receipt link (if applicable).
- List of unmatched items or discrepancies with suggested resolution.
- Short reconciliation summary (totals, match rate, follow-up items).

### When to use

- User asks to reconcile bank statements, match books, or link receipts to rows.
- User needs audit-ready export from PDF or scattered sources.

### Validation checklist

- Dates normalized to ISO; currency notation consistent.
- Every row has required fields; N/A only where justified and noted.
- Receipt links valid or placeholder with "To upload."

---

## Part 2 — Financial Modeling

Build, review, and extend financial models for planning, fundraising, or board reporting.

### Purpose

- **Structure** revenue, costs, and cash flow (e.g. monthly/quarterly P&L, balance sheet, cash flow).
- **Scenario analysis** (base/upside/downside) with clear assumptions and drivers.
- **Review** existing models: sanity-check formulas, flag inconsistencies, suggest improvements.
- **Cap table / round modeling** when relevant (optional; can coordinate with fundraising section).

### Inputs

- Business type, stage, and key drivers (e.g. MRR, churn, headcount, CAC).
- Optional: existing spreadsheet, historicals, targets, currency (e.g. € or $).

### Outputs

- Structured assumptions (list or table) with units and growth rates.
- Formula logic or pseudocode for key line items (revenue, gross margin, opex, cash).
- Scenario outputs (e.g. revenue and runway at 12/24 months) and sensitivity callouts.
- If reviewing: short audit of structure, formula risks, and suggested fixes.

### When to use

- User asks to build a financial model, run scenarios, or review a model.
- Financial-manager agent invokes this for planning or alongside fundraising materials.

### Validation checklist

- Assumptions are explicit and dated.
- Revenue and cost logic is consistent (e.g. no double-counting).
- Cash flow ties to P&L and balance sheet where applicable.

---

## Part 3 — Fundraising

Turn every scrap of fundraising data—decks, models, e-mails, CRM notes—into sharper investor conversations, stronger materials, tighter process analytics, and faster closes. Outputs are structured into five sections: Investor-Ready Messaging, Materials Upgrade Report, Process Diagnostics, Speed-Up Plan, and Quick Wins & Risks.

### When to Use

- User asks to improve pitch deck, financial model, or data room.
- User wants investor messaging or FAQ rebuttals.
- User needs pipeline diagnostics or speed-up plan for a raise.
- User is preparing for investor conversations or analyzing bottlenecks.

### Inputs Required

- **Primary:** Pitch deck (PDF/PPTX), financial model (XLSX/CSV), data room summary, or CRM/pipeline snapshot (PDF, PPTX, XLSX, CSV, DOCX, or raw text).
- **Optional:** Named investors to tailor hooks; stage (seed, A, B); target close date; currency (normalise to one, e.g. EUR or USD).

### Outputs Produced

- **Structured report** with five sections matching `templates/materials-upgrade-report.md` and the structure in Core Process below.
- **Optional JSON** for Speed-Up Plan conforming to `templates/speed-up-plan.json`.
- A clear **checklist of gaps** if inputs are missing; suggest what to add.

### Tooling Rule

- Use Read/Write to load deck, model, or CRM artifacts and to save the report.
- If a schema validator is added under `scripts/`, run it post-generation and reject if required sections are missing.
- Prefer citing sources inline (e.g. `[Source:Slide5]`); mark estimates with `(est.)`.

### Core Process

#### 1. Gather inputs

- Locate or ask for: pitch deck, financial model, data room summary, or pipeline/CRM snapshot.
- Normalise dates to YYYY-MM-DD and currency (e.g. EUR) across all inputs.
- If data is missing, note gaps and still produce the five sections with placeholders where needed.

#### 2. Produce Investor-Ready Messaging

- **Core Narrative (≤50 words):** Why now, why us. Use `references/investor-messaging-frameworks.md` for structure.
- **Tailored Hooks:** 1-line pitch variants for up to 3 named investors.
- **FAQ Rebuttals:** Top 5 questions and concise answers with data cites. Mark estimates with `(est.)`.

#### 3. Produce Materials Upgrade Report

- Table: Asset (Pitch Deck, Financial Model, Data Room) | Strength (0–10) | Gap | Next Action.
- **Priority Fix List:** Rank gaps by investor impact, then effort. Use format in `templates/materials-upgrade-report.md`.
- Every gap must map to a "Next Action" with owner and due date; use "Next:" prefix.

#### 4. Produce Process Diagnostics

- **Pipeline Snapshot:** # investors per stage, avg. days in stage, win rate.
- **Bottlenecks:** Stage with highest drop-off and root cause.
- **Metric Benchmarks:** Compare to top-quartile SaaS at your stage using `references/process-benchmarks.md`.

#### 5. Produce Speed-Up Plan

- **Critical Path Timeline:** Outreach → first meetings → term sheet → close (target dates).
- **Time Savers:** Up to 3 automations or templates to remove manual steps.
- **Accountability Matrix:** Who owns each next step. Optional: output JSON per `templates/speed-up-plan.json`.

#### 6. Produce Quick Wins & Risks

- **Quick Wins (≤3):** Moves the user can execute this week for outsized impact.
- **Top 3 Risks:** With mitigation playbook.

#### 7. Close with reflection

- End with: *Reflection »* _Which single action will compress our close date the most?_

### Using Supporting Resources

| Resource | Path | Purpose |
|----------|------|---------|
| References index | `references.md` | Points to all reference files |
| Investor messaging | `references/investor-messaging-frameworks.md` | Core narrative, hooks, FAQ structure |
| Process benchmarks | `references/process-benchmarks.md` | Stage duration and pipeline health reference |
| Materials report template | `templates/materials-upgrade-report.md` | Table and priority-fix format |
| Speed-up plan schema | `templates/speed-up-plan.json` | JSON structure for timeline and accountability |
| Example output | `examples/fundraise-output-example.md` | Example excerpt of full output |

### Example Workflow

**User:** "I have our pitch deck and model here; we're raising a Series A. Give me investor messaging and a materials upgrade report."

1. Read deck and model (or ask for paths).
2. Produce Core Narrative, Tailored Hooks (ask for 1–3 investor names if not provided), FAQ Rebuttals.
3. Score Pitch Deck and Financial Model (0–10), list gaps and Next Actions.
4. Produce Priority Fix List with owner and due date.
5. If pipeline data is provided, add Process Diagnostics and Speed-Up Plan; otherwise note "Add pipeline/CRM for process section."
6. Add Quick Wins & Risks and the reflection question.
7. Deliver the five sections; offer to iterate (e.g. "add a slide," "refine narrative").

### Validation checklist

- [ ] All five sections present (Investor Messaging, Materials Report, Process Diagnostics, Speed-Up Plan, Quick Wins & Risks).
- [ ] Every gap has a Next Action with owner and due date.
- [ ] Scores (0–10) for Material Readiness / Process Efficiency; any score ≤4 or ≥9 has one-line justification.
- [ ] Dates in YYYY-MM-DD; currency normalised; sources cited inline; estimates marked `(est.)`.
- [ ] Reflection question at the end.
- [ ] No section exceeds ~200 words; bullets preferred over long prose.

---

## Cross-Part Notes

- Parts 2 and 3 often run together: financial model review pairs naturally with a fundraising materials audit.
- Part 1 feeds Part 2: reconciled books give the actuals needed to anchor model assumptions.
- Run **financial-manager** agent for the full integrated flow (reconciliation → modeling → fundraising).
- Re-run any part with new or updated inputs as materials, model assumptions, or pipeline data change.

## Legal disclaimer

This skill provides guidance based on common finance and fundraising best practices and benchmarks; it is **not** legal, tax, or financial advice. Always consult qualified advisors for term sheets, cap table, and compliance. Jurisdictions differ; investor conversations may be subject to securities regulations.
