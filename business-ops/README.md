# Business Ops

Business operations workflows for finance, reporting, research, and executive review.

## What lives here

- Skills: `finances`, `reporting`, `research`, `review`
- Commands: `inbox-triage`, `reconcile-books`, `model-scenarios`, `investor-messaging`, `materials-audit`
- Agents: `executive`, `deep-research`, `financial-analyst`, `vp-of-operations`

This plugin is the operations layer of the repo: it turns messy company inputs into decision-ready outputs.

## Install

Install the whole plugin with `skills`:

```bash
npx -y skills add ./business-ops
```

Install one skill into Codex manually:

```bash
mkdir -p ~/.codex/skills
cp -R business-ops/skills/finances ~/.codex/skills/
```

Use Codex `$skill-installer` against the plugin path:

```text
https://github.com/alvarovillalbaa/plugins/tree/main/business-ops
```

## Skills

- [`finances`](./skills/finances/README.md): reconciliation, close management, modeling, and fundraising support
- [`reporting`](./skills/reporting/README.md): weekly, monthly, board, and KPI reporting
- [`research`](./skills/research/README.md): decision-oriented market, account, customer, and synthesis research workflows
- [`review`](./skills/review/README.md): intensive review workflows for code, plans, and executive thinking
