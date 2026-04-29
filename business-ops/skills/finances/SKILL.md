---
name: finances
description: >-
  Use for finance operations across expense and bill monitoring, reconciliation,
  month-end close management, executive CFO briefings, scenario modeling, tax
  document organization, and fundraising materials. Covers receipt and invoice
  intake, recurring bill control, bank and GL/subledger reconciliations, close
  dashboards, QuickBooks or ERP export review, runway and burn analysis,
  Sheets-backed workpapers, evidence storage, tax-document checklists, and
  investor messaging or process diagnostics.
version: 1.3.0
license: MIT
compatibility: Instruction-only. Optional tools for Gmail, Drive/Sheets, and file read/write.
---

# Finances Skill

Use this skill when the work touches the finance operating system, not just a
single spreadsheet.

It covers six linked modes:

- expense operations and bill monitoring
- reconciliation and evidence gathering
- month-end close planning and blocker tracking
- executive CFO briefings, scenario work, and planning models
- tax document readiness and evidence packaging
- fundraising materials, pipeline diagnostics, and close acceleration

## Core Operating Contract

For every finance task, establish these before analysis:

1. reporting period or effective date
2. legal entity, household, or scope
3. source of truth for each number or document
4. output artifact the user needs
5. owner, reviewer, and unresolved decisions if this affects close, audit, or filing

Normalize dates to `YYYY-MM-DD` and normalize currency before comparing
sources. If the user mixes entities, periods, or currencies, stop and split the
work into clean scopes.

## Evidence And Artifact Management

Finance work degrades when evidence is scattered. Treat storage, comments, and
reviewable workpapers as part of the workflow.

If Google Drive or shared storage is available:

- search for the existing folder or file before creating duplicates
- keep one canonical location for statements, receipts, models, decks, tax
  packs, and close outputs
- preserve links to source files, exported workpapers, and reviewer comments
- use comments or replies on shared files for open questions and review history
- export or copy only when the downstream consumer truly needs a separate file

If work is local-only:

- keep stable relative paths in outputs
- name files by period and entity
- separate source documents from generated outputs

See `references/drive-evidence-ops.md` when the task needs a concrete storage
pattern.

## Sheets-Backed Workpapers

When the work is fundamentally row-oriented, prefer a canonical sheet over free
text notes or duplicate CSVs.

Use a sheet when the user needs:

- a bill calendar with due dates, autopay, and owner fields
- an expense review queue or reconciliation tracker
- a close dashboard with owners, deadlines, and blocker status
- a tax-document checklist with missing items and evidence links
- scenario inputs and outputs that multiple reviewers must update safely

Recommended tabs:

- `bill_calendar`
- `expense_review_queue`
- `recon_items`
- `close_dashboard`
- `tax_doc_checklist`
- `scenario_inputs`
- `scenario_outputs`

Operating rules:

- read the current structure before writing
- update only the rows or ranges you intend to change
- preserve formulas, protected tabs, comments, and validation rules
- prefer atomic multi-change updates over scattered edits
- keep raw imports separate from reviewed or presentation tabs

See `references/google-sheets-workpapers.md` for the connector-first and
schema-first pattern adapted from `gws-sheets`.

## Mode 1: Expense Operations And Bill Monitoring

Use for receipt intake, expense categorization, weekly or monthly spend review,
budget monitoring, recurring bill tracking, or any request to turn messy
transaction activity into a usable finance operating view.

### Expense And Bills Workflow

1. define the scope: accounts, entity, reporting period, and base currency
2. gather raw sources: receipts, bank notifications, exported transactions,
   invoices, email bill notices, and any recurring bill schedule
3. normalize each row to a canonical schema before analysis
4. categorize with explicit rules first, then review uncategorized or odd items
5. build a bill calendar from due dates, autopay status, and payment evidence
6. flag duplicates, suspicious amounts, missing support, bill spikes, and new or
   missing recurring billers
7. compare spend against the active budget or burn guardrail
8. emit a structured report with totals, alerts, and follow-ups

### Canonical Expense Row Schema

Normalize expense rows to:

- `date`
- `description`
- `merchant`
- `amount`
- `currency`
- `account`
- `category`
- `source`
- `receipt_link`
- `invoice_id`
- `is_recurring`
- `status`

For recurring bills, maintain:

- `name`
- `amount`
- `currency`
- `due_day` or `due_date`
- `autopay`
- `owner`
- `category`
- `account`
- `status`
- `last_seen_date`
- `statement_link`

### Categorization Rules

Prefer deterministic categorization before free-form judgment:

- use merchant and keyword rules first
- keep a visible `uncategorized` bucket until evidence improves
- only promote a new category if it will recur or affects reporting
- distinguish operating expense categories from balance-sheet settlements

Useful default categories:

- `food`
- `transport`
- `utilities`
- `entertainment`
- `shopping`
- `health`
- `housing`
- `education`
- `subscription`
- `software`
- `professional_services`
- `payroll_related`
- `taxes_fees`
- `uncategorized`

### Bill Monitoring Rules

Organize bills into:

- `overdue`
- `due_this_week`
- `due_this_month`
- `autopay_scheduled`

Default alert thresholds:

- due in `0-2` days without confirmed autopay or payment: `urgent`
- due in `3-7` days: `upcoming`
- significant amount increase versus prior periods: `investigate`
- new biller with material amount: `review_now`
- expected recurring bill missing this cycle: `investigate`
- autopay status unclear: assume manual attention is required

If the evidence comes from email, search recent mail for phrases such as
`bill`, `statement`, `amount due`, `payment due`, `invoice`, and `autopay`.
Note when the only support is a PDF attachment that still needs manual review.

### Required Output Shape

Produce:

- categorized expense ledger or summary table
- period totals with category rollup and largest drivers
- budget status with `budget_amount`, `actual_amount`, `variance_amount`, and
  `variance_pct`
- review queue for `uncategorized`, duplicate, suspicious, unsupported, or
  missing-recurring items
- bill calendar with `name`, `due_date`, `days_until_due`, `amount`, `owner`,
  `autopay`, `status`, and `next_action`

See `references/expense-ops.md` for concrete cadence, schemas, categorization
patterns, anomaly checks, reminder rules, and sheet layout.

## Mode 2: Reconciliation

Use for bank recs, GL-to-subledger recs, intercompany recs, expense and receipt
matching, or any request to explain why two finance views do not tie.

### Reconciliation Workflow

1. define the reconciliation type and as-of date
2. load both sides from authoritative sources
3. normalize keys: date, amount sign, entity, account, currency, description
4. compare totals first, then line items
5. classify every exception
6. attach evidence, owner, and next action
7. summarize what is resolved, what needs entries, and what blocks close

### Supported Reconciliation Types

- bank to GL cash
- GL control account to subledger
- intercompany receivable/payable
- expense rows to receipts or support
- source exports to reporting model actuals

### Exception Categories

Classify each difference into one of these buckets:

- `timing_difference`: normal processing lag; should clear without an entry
- `adjustment_required`: needs JE or source-system correction
- `investigate`: cause is not yet known

Never leave a discrepancy unclassified.

### Required Output Shape

Produce:

- reconciliation summary: balances compared, net difference, close impact
- reconciling items table with `id`, `category`, `owner`, `status`, `age_days`,
  `next_action`, and `evidence_link`
- journal-entry queue for any `adjustment_required` items
- blocker list for anything that prevents sign-off

Track aging aggressively. As a default:

- `0-30` days: current
- `31-60` days: investigate
- `61-90` days: escalate
- `90+` days: stale and management review

See `references/reconciliation-playbook.md` for detailed methods, root causes,
aging, and escalation triggers.

## Mode 3: Month-End Close Management

Use when the user wants a close calendar, status dashboard, dependency plan,
accelerated-close design, or blocker review.

### Close Management Workflow

1. identify close target: standard or accelerated
2. map tasks by day and by dependency level
3. assign owners, deadlines, and reviewer
4. identify the critical path
5. track status and blockers daily
6. escalate risks to close timing
7. finish with retrospective improvements

### Default Close Cadence

Use the standard `pre-close`, `T+1`, `T+2`, `T+3`, `T+4`, `T+5` framing unless
the user already has a company-specific calendar.

Typical critical path:

`cash/AP/AR entries -> subledger reconciliations -> balance sheet recs -> tax provision -> draft financials -> management review -> hard close`

When asked to shorten close duration, default recommendations are:

- automate recurring Level 1 entries
- pre-reconcile during the month
- parallelize independent reconciliations
- reduce handoffs and late submissions
- standardize support and variance templates

### Required Close Output Shape

Produce a dashboard or table with:

- `task`
- `owner`
- `deadline`
- `status`
- `dependency`
- `blocker`
- `notes`

Use these status values:

- `not_started`
- `in_progress`
- `complete`
- `blocked`
- `at_risk`

When the user asks for a faster close, include:

- current close duration
- target duration
- prerequisites to hit the target
- bottlenecks
- automation or process fixes

See `references/close-management.md` for the day-by-day checklist, dependency
map, critical path, 3-day close prerequisites, and retrospective questions.

## Mode 4: Executive CFO Briefings And Scenario Work

Use for QuickBooks or ERP export review, board-ready finance summaries, cash and
burn analysis, runway review, cost-driver analysis, planning models, or scenario
packs that need clear operating conclusions.

### Typical Inputs

Useful inputs include any subset of:

- P&L summary or detail
- balance sheet
- cash flow statement
- general ledger
- expenses by vendor
- transaction list by vendor
- AP or bill payment history
- account list or chart of accounts
- headcount or payroll summary

The skill should still work when the user only has one or two of these inputs.
State the confidence limits if source coverage is partial.

### CFO Briefing Workflow

1. identify the accounting system, report dates, and entity scope
2. ingest the available exports and map them to a common structure
3. compute core KPIs and compare against prior periods when history exists
4. flag anomalies: margin changes, vendor spikes, concentration risk, or cash deterioration
5. produce a red/yellow/green operating summary with supporting evidence
6. model named scenarios when the user needs forward-looking guidance
7. tie every recommendation back to a cost lever, revenue lever, or risk control

### Required CFO Briefing Outputs

Produce:

- executive summary with `green`, `yellow`, or `red` status per key area
- KPI table for revenue, gross margin, operating income, net income, burn,
  runway, people costs, tool costs, and concentration risk when available
- month-over-month or period-over-period change table when history exists
- anomaly list with evidence, likely cause, and next action
- scenario section with base, upside, and downside assumptions when requested
- explicit limitations when any major source is missing

### Modeling Rules

- make assumptions explicit and dated
- show ranges when estimating
- separate historical actuals from forecast assumptions
- surface the few drivers that matter most instead of cluttering the output
- call out structural model risks such as circularity, broken ties, or unsupported inputs

Use `references/cfo-briefings.md` and `templates/cfo-briefing.md` when the
user needs an executive-ready artifact.

## Mode 5: Tax Document Readiness

Use for tax-document cleanup, filing-season document intake, deduction support
gathering, missing-document checklists, or any request to turn a messy tax
folder into a reviewable package.

### Tax Document Workflow

1. define the tax year, entity or household scope, and filing context
2. scan the folder, inbox, or shared drive for likely tax documents
3. categorize documents by type using filename, sender, or statement context
4. place or reference each document in a stable year/category structure
5. build a checklist with found, missing, duplicate, and unclear items
6. highlight categories that may be missing while noting they may not apply
7. produce a package the user or advisor can review quickly

### Common Tax Categories

Track categories such as:

- `W-2 (Wages)`
- `1099 (Income)`
- `1098 (Deductions)`
- `Receipts & Expenses`
- `Charitable Donations`
- `Medical Expenses`
- `Property Tax`
- `Mortgage Interest`
- `Investment Records`
- `Business/Self-Employment`
- `Education/Dependents`
- `Insurance`
- `State & Local Tax`
- `Retirement`
- `Uncategorized`

### Required Output Shape

Produce:

- document inventory with `category`, `document_name`, `source`, `path_or_link`,
  `status`, and `notes`
- missing or likely-missing categories with a short explanation
- duplicate or unreadable-document queue
- year/category folder recommendation if the documents are still unstructured
- advisor handoff summary when the user wants a filing pack

Use `scripts/tax_document_inventory.py` for non-destructive directory scans and
`templates/tax-document-checklist.md` for the review artifact. See
`references/tax-document-ops.md` for category rules, folder structure, and
review guidance.

## Mode 6: Fundraising

Use for investor messaging, materials audits, pipeline diagnostics, or plans to
compress fundraising cycle time.

Outputs are structured into five sections:

1. Investor-Ready Messaging
2. Materials Upgrade Report
3. Process Diagnostics
4. Speed-Up Plan
5. Quick Wins & Risks

### Fundraising Workflow

1. gather the deck, model, data room summary, and pipeline snapshot
2. normalize dates, stage, entity, and currency
3. produce messaging with evidence-backed FAQ rebuttals
4. score materials and assign concrete next actions
5. diagnose pipeline bottlenecks and stage velocity
6. build a speed-up plan with owners and target dates
7. close with the single highest-leverage action

### Investor Messaging Rules

- core narrative must answer why now, why this team, and why this business
- tailored hooks should be one-line variations, not full rewrites
- FAQ rebuttals should cite the underlying deck, model, or CRM evidence
- mark estimates with `(est.)`

### Materials Upgrade Rules

- every gap needs a next action
- every next action needs an owner and due date when those can be inferred
- prioritize by investor impact first, effort second

### Process Diagnostics Rules

- show stage counts, days in stage, and obvious drop-off points
- compare against `references/process-benchmarks.md` when useful
- name the bottleneck, likely cause, and the operational fix

### Speed-Up Plan Rules

- map the critical path from outreach to close
- identify automations, templates, or prep work that remove cycle time
- optionally emit JSON matching `templates/speed-up-plan.json`

Use `references/investor-messaging-frameworks.md`,
`templates/materials-upgrade-report.md`, and
`examples/fundraise-output-example.md` as needed.

## Operating Cadence Defaults

When the user asks for a finance operating rhythm and does not provide one,
default to:

- daily 20:00 local time: ingest new receipts and notifications, categorize new
  spend, and refresh the review queue
- weekly Sunday 18:00 local time: issue expense summary with budget status and
  category drivers
- weekly Monday 08:00 local time: refresh the bill calendar, surface amount
  spikes, and highlight manual payments due soon
- weekly Monday 09:00 local time during filing season: refresh the tax document
  checklist and missing-item report
- month-end: roll unresolved expense or recon exceptions into close blockers and
  cash forecast updates

These defaults are strong starting points, not mandatory schedules. Override
them when the company already has a known AP, treasury, tax, or close cadence.

## Integrated Finance Flows

These modes are designed to chain together:

- expense operations -> reconciliation: categorized spend and bill control reduce
  unresolved cash and support exceptions
- expense operations -> close management: due bills and unsupported expenses
  become AP or close blockers when they age
- reconciliation -> close management: unresolved recon items become close blockers
- reconciliation -> CFO briefing: cleaner actuals improve briefing credibility
- CFO briefing -> modeling: anomaly review improves forecast assumptions
- tax readiness -> close management: clean evidence and document folders reduce
  filing and audit friction
- modeling -> fundraising: the investor model should reconcile to the operating model
- fundraising -> close management: weak monthly finance discipline later shows up
  as diligence friction

When the user asks for a broad finance improvement effort, default to this
sequence:

1. stabilize expense intake and bill monitoring
2. reconcile the numbers
3. stabilize the close process
4. build the CFO briefing and scenario view
5. clean up tax evidence and document readiness
6. upgrade investor-facing materials if fundraising is active

## Validation Checklist

- [ ] Dates, currency, and entity scope are normalized.
- [ ] Every number in the output has a named source or is marked as estimated.
- [ ] Expense rows are normalized and categorized or explicitly left as `uncategorized`.
- [ ] Duplicate, suspicious, unsupported, or missing recurring items are flagged.
- [ ] Bills have due timing, owner, and autopay status.
- [ ] Every discrepancy or blocker has an owner and next action.
- [ ] Reconciliation exceptions are categorized and aged.
- [ ] Close outputs include dependency-aware status, not just a checklist.
- [ ] CFO briefings state source coverage, KPI status, and scenario assumptions.
- [ ] Tax-document outputs distinguish found, missing, duplicate, and unclear items.
- [ ] Fundraising outputs include all five sections when that mode is requested.

## Legal Disclaimer

This skill provides guidance based on common finance, tax-operations, and
fundraising practices; it is **not** legal, tax, or financial advice. Always
consult qualified advisors for filings, tax positions, securities matters, cap
table decisions, and compliance. Jurisdictions differ.
