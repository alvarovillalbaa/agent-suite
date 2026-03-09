---
name: help
description: List the available agents and commands, grouped by workflow, with a short recommendation on when to use an agent versus a command.
argument-hint: ""
allowed-tools: [Read]
---

List the suite capabilities in a clear, grouped format.

Include:

**Agents**
- `content-manager` – Multi-step content planning, drafting, and distribution.
- `financial-manager` – Reconciliation, modeling, investor messaging, materials, and pipeline diagnostics.
- `sales-manager` – Account research, outreach, competitor analysis, and follow-up.
- `social-media-manager` – LinkedIn and X content plus engagement.
- `visual-manager` – Visual explainers, decks, and video outputs.
- `swe` – Engineering review, QA, docs, visualization, and repo learning.

**Commands**
- Content: `content-brief`, `blog-draft`, `social-pack`
- Sales and research: `account-brief`, `outreach`, `competitor-scan`, `inbox-triage`
- Social engagement: `linkedin-engage`, `x-engage`
- Finance and fundraising: `reconcile-books`, `model-scenarios`, `investor-messaging`, `materials-audit`, `pipeline-diagnostics`
- Visuals: `visualize`, `slides`, `video`
- Engineering: `repo-review`, `docs-pass`, `learning-sync`
- Utility: `help`

Close with:

- Use a **command** when the job is a stable, narrow automation.
- Use an **agent** when the work spans multiple commands or skills.
