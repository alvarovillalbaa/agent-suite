# Quickstart

## Install

- **Claude Code (plugin):** `claude --plugin-dir /path/to/agent-suite` or `git clone https://github.com/alvarovillalbaa/agent-suite.git ~/.claude/plugins/agent-suite`
- **npx skills add (Vercel):** `npx skills add alvarovillalbaa/agent-suite`
- **OpenClaw:** `git clone https://github.com/alvarovillalbaa/agent-suite.git ./skills/agent-suite` (or `~/.openclaw/skills/agent-suite`); point runtime at `skills/` in clone

See [README](../README.md#install) for the full install matrix and command inventory.

## Configure

Optional: create a project context file for your runtime with brand, product, finance, or workflow defaults. See [docs/agent-suite-integration.md](./agent-suite-integration.md) for repo-specific examples.

## Try it

**Commands** (use `/agent-suite:<command>` in Claude Code):

- `/agent-suite:content-brief` – Create the working content brief
- `/agent-suite:blog-draft` – Turn notes or research into a blog draft
- `/agent-suite:outreach` – Research an account and draft outreach
- `/agent-suite:investor-messaging` – Draft the fundraising narrative and FAQs
- `/agent-suite:visualize` – Create a shareable HTML explainer or review page
- `/agent-suite:repo-review` – Run a focused engineering review
- `/agent-suite:slides` – Create an HTML slide deck
- `/agent-suite:video` – Generate a video from a brief
- `/agent-suite:help` – List all agents and commands

**Orchestrator agents**

- **content-manager** – Brief → draft → syndication
- **financial-manager** – Reconciliation, modeling, investor messaging, materials, diagnostics
- **sales-manager** – Prospect research, outreach, competitor analysis, inbox follow-up
- **social-media-manager** – LinkedIn and X content and engagement
- **visual-manager** – Visual explainers, decks, and video
- **swe** – Engineering review, docs, QA, visuals, learning capture

Invoke an agent by name when you want a multi-step workflow; use a command for a single skill flow.

## Update

From repo root you can run `./scripts/update.sh` to auto-detect and update, or `./scripts/update-from-upstream.sh` for a direct git-based update.
