# Sales

Sales workflows for GTM execution, pipeline health, prospect research, and outreach messaging.

## What lives here

- Skills: `go-to-market`, `sales-pipeline`, `prospect-research`, `message-outreach`
- Commands: `account-brief`, `outreach`, `competitor-scan`, `pipeline-diagnostics`
- Agents: `sales-prospecting`

Use this plugin when the output should help qualify, prioritize, message, or advance revenue opportunities.

## Install

Install the whole plugin with `skills`:

```bash
npx -y skills add ./sales
```

Install one skill into Codex manually:

```bash
mkdir -p ~/.codex/skills
cp -R sales/skills/prospect-research ~/.codex/skills/
```

Use Codex `$skill-installer` against the plugin path:

```text
https://github.com/alvarovillalbaa/plugins/tree/main/sales
```

## Skills

- [`go-to-market`](./skills/go-to-market/README.md): GTM planning, messaging, and commercial execution
- [`sales-pipeline`](./skills/sales-pipeline/README.md): forecast, stage health, and deal inspection
- [`prospect-research`](./skills/prospect-research/README.md): decision-ready account and persona briefs
- [`message-outreach`](./skills/message-outreach/README.md): skimmable outreach briefs and qualification framing
