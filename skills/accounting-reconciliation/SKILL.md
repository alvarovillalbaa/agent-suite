---
name: accounting-reconciliation
description: Reconcile bank statements, movements, and ledgers; map PDF statements to structured rows (e.g. XLSX); link receipts and uploads to line items. Use when the user has bank PDFs, receipts, or ledgers and needs matched, auditable rows for books or Drive.
version: 1.0.0
license: MIT
compatibility: Instruction-only. Optional tools for file read/write.
---

# Accounting Reconciliation Skill

Reconcile bank movements, statements, and receipts into structured, auditable line items.

## Purpose

- Turn **bank movement statements (PDF)** into **XLSX row items** with consistent date, amount, description, and category.
- Map **receipts** to upload locations (e.g. Drive) and **link them to XLSX row items** for audit trail.
- Flag **discrepancies** between statements and ledger or between multiple sources.

## Inputs

- Bank statements (PDF), CSV/Excel exports, or raw transaction lists.
- Receipts (scans, photos, or paths) and desired storage (e.g. Drive folder).
- Optional: chart of accounts, category mapping, date range, currency (default €).

## Outputs

- Structured rows (e.g. XLSX/CSV) with: date (YYYY-MM-DD), amount, description, category, receipt link (if applicable).
- List of unmatched items or discrepancies with suggested resolution.
- Short reconciliation summary (totals, match rate, follow-up items).

## When to use

- User asks to reconcile bank statements, match books, or link receipts to rows.
- User needs audit-ready export from PDF or scattered sources.

## Validation checklist

- Dates normalized to ISO; currency notation consistent.
- Every row has required fields; N/A only where justified and noted.
- Receipt links valid or placeholder with “To upload.”
