---
name: reconcile-books
description: Reconcile bank statements, receipts, and ledger rows into auditable outputs using the accounting-reconciliation skill.
argument-hint: "[statements, receipts, or reconciliation context]"
allowed-tools: [Read, Write, AskUserQuestion, Skill]
---

Use skill: **accounting-reconciliation** — `skills/accounting-reconciliation/SKILL.md`.

1. **Gather the finance inputs** – Ask for statements, transaction exports, receipts, and desired output format.
2. **Normalize the data** – Extract or structure the transactions into a consistent row format.
3. **Reconcile the sources** – Match receipts, flag discrepancies, and note unresolved items.
4. **Prepare the audit view** – Produce the structured output plus the unresolved follow-up list.
5. **Deliver** – Output reconciled rows, summary stats, and the items that still need human confirmation.
