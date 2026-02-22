# Quickstart

## Install

- **Claude Code (plugin):** `claude --plugin-dir /path/to/agent-suite` or `git clone https://github.com/alvarovillalbaa/agent-suite.git ~/.claude/plugins/agent-suite`
- **npx skills add (Vercel):** `npx skills add alvarovillalbaa/agent-suite`
- **OpenClaw:** `git clone https://github.com/alvarovillalbaa/agent-suite.git ./skills/agent-suite` (or `~/.openclaw/skills/agent-suite`); point runtime at `skills/` in clone

See [README](../README.md#installation) (Installation and Updating) for the full install table and update one-liners.

## Configure

Optional: copy the settings template and edit for your context:

```bash
cp templates/settings-template.md .claude/agent-suite.local.md
```

## Try it

**Commands** (use `/agent-suite:<command>` in Claude Code):

- `/agent-suite:video` – Generate a video from a brief
- `/agent-suite:slides` – Create an HTML slide deck
- `/agent-suite:fundraise` – Fundraising materials and process
- `/agent-suite:content-brief` – Content/campaign brief (optionally draft)
- `/agent-suite:outreach` – Prospect research and outreach
- `/agent-suite:help` – List all agents and commands

**Orchestrator agents**

- **content-manager** – Brief → blog, LinkedIn, X, syndication
- **financial-manager** – Reconciliation, modeling, fundraising
- **sales-manager** – Prospect research, outreach, competitor intel
- **social-media-manager** – LinkedIn and X content and engagement

Invoke an agent by name when you want a multi-step workflow; use a command for a single skill flow.

## Update

See **README → Updating** for one-liners per install method. From repo root you can run `./scripts/update.sh` to auto-detect and update, or `./scripts/update-from-upstream.sh` for git pull.
