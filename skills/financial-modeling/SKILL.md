---
name: financial-modeling
description: Build, review, or extend financial models (P&L, cash flow, cap table, scenario analysis). Use when the user needs a new model structure, sanity checks, or scenario outputs for planning or fundraising.
version: 1.0.0
license: MIT
compatibility: Instruction-only. Optional file inputs (Excel, CSV); outputs as structured assumptions and formulas or code.
---

# Financial Modeling Skill

Build, review, and extend financial models for planning, fundraising, or board reporting.

## Purpose

- **Structure** revenue, costs, and cash flow (e.g. monthly/quarterly P&L, balance sheet, cash flow).
- **Scenario analysis** (base/upside/downside) with clear assumptions and drivers.
- **Review** existing models: sanity-check formulas, flag inconsistencies, suggest improvements.
- **Cap table / round modeling** when relevant (optional; can coordinate with fundraising skill).

## Inputs

- Business type, stage, and key drivers (e.g. MRR, churn, headcount, CAC).
- Optional: existing spreadsheet, historicals, targets, currency (e.g. € or $).

## Outputs

- Structured assumptions (list or table) with units and growth rates.
- Formula logic or pseudocode for key line items (revenue, gross margin, opex, cash).
- Scenario outputs (e.g. revenue and runway at 12/24 months) and sensitivity callouts.
- If reviewing: short audit of structure, formula risks, and suggested fixes.

## When to use

- User asks to build a financial model, run scenarios, or review a model.
- Financial-manager agent invokes this for planning or alongside fundraising materials.

## Validation checklist

- Assumptions are explicit and dated.
- Revenue and cost logic is consistent (e.g. no double-counting).
- Cash flow ties to P&L and balance sheet where applicable.
