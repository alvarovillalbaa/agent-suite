# Agent Suite

Productivity and business toolkit: content, finance, sales, and social media workflows via skills, commands, and orchestrating agents.

## Features

### Skills

| Skill | Purpose |
|-------|---------|
| accounting-reconciliation | Match books, statements, and ledgers; flag discrepancies |
| blog-articles | Draft and structure blog posts |
| briefings | Create briefs and content plans |
| competitors | Competitive intel and positioning |
| content-syndication | Repurpose and distribute content across channels |
| financial-modeling | Build and review financial models |
| fundraising | Investor messaging, materials upgrade, process diagnostics |
| industry-discovery | Industry and market research |
| linkedin-articles | LinkedIn long-form articles |
| linkedin-engagement | LinkedIn comments and engagement |
| message-outreach | Outreach and sales messaging |
| prospect-research | Prospect and account research |
| code-slides | Code-based slide decks, HTML presentations, and PPT-to-web conversion |
| video-generation | Programmatic video (Remotion-style) |
| x-articles | X/Twitter threads and articles |
| email-inbox-management | Email triage and reply drafting (placeholder) |
| x-engagement | X/Twitter replies and engagement (placeholder) |
| suite-router | Map intent to command/agent/skill (routing index) |

### Commands

Commands are namespaced by plugin name: use `/agent-suite:<command>` in Claude Code (e.g. `/agent-suite:video`).

| Command | Skill(s) | Description |
|---------|----------|-------------|
| `video` | video-generation | Generate video from brief (Remotion) |
| `slides` | code-slides | Create HTML or code-based slide deck from topic/brief |
| `fundraise` | fundraising | Investor messaging, materials upgrade, process diagnostics |
| `content-brief` | briefings (+ content flow) | Content/campaign brief; optionally draft blog/LinkedIn/X |
| `outreach` | message-outreach, prospect-research | Research brief and optional LinkedIn engagement drafts |
| `help` | — | List agents and commands |

### Agents (orchestrators)

Agents orchestrate multiple skills; use them for multi-step workflows.

| Agent | Scope | Skills |
|-------|-------|--------|
| content-manager | Content planning, drafting, distribution (blog, LinkedIn, X) | briefings, blog-articles, content-syndication, x-articles, linkedin-articles |
| financial-manager | Reconciliation, modeling, fundraising | accounting-reconciliation, financial-modeling, fundraising |
| sales-manager | Prospect research, outreach, competitor intel | prospect-research, message-outreach, competitors |
| social-media-manager | LinkedIn and X content and engagement | linkedin-articles, linkedin-engagement, x-articles, content-syndication |

### Hooks

- **PreToolUse**: MCP legitimacy check; Bash guard for destructive commands; optional JSON/PII validation on Write/Edit
- **PostToolUse**: Suggest next `/agent-suite:*` command or agent after key deliverable writes; optional JSON validation
- **UserPromptSubmit**: Classify intent using suite-router mapping; suggest relevant `/agent-suite:*` command or agent
- **Stop**: Caveats for legal/financial guidance when response has material impact
- **SubagentStop**: Append one-liner to session audit (Subagent X produced Y)
- **SessionStart / SessionEnd / PreCompact**: Load config, session audit, compaction summary

## Installation

| Method | Install | Update |
|--------|--------|--------|
| **Claude Code (plugin)** | `git clone https://github.com/alvarovillalbaa/agent-suite.git ~/.claude/plugins/agent-suite` or `claude --plugin-dir /path/to/agent-suite` | `cd ~/.claude/plugins/agent-suite && git pull` or `./scripts/update-from-upstream.sh` |
| **npx skills add (Vercel)** | `npx skills add alvarovillalbaa/agent-suite` (optional: `--skill <name>` for one skill) | Re-run the same `npx skills add` command to refresh |
| **OpenClaw** | `git clone https://github.com/alvarovillalbaa/agent-suite.git ./skills/agent-suite` or `~/.openclaw/skills/agent-suite`; point runtime at `skills/` in clone. With ClawHub: `clawhub install` when the pack is registered | `git pull` in the cloned repo; restart or reload runtime |

### Claude Code (plugin)

```bash
# Development: load from repo
claude --plugin-dir /path/to/agent-suite

# Permanent: clone into plugins dir
cd ~/.claude/plugins
git clone https://github.com/alvarovillalbaa/agent-suite.git agent-suite
```

### npx skills add (Vercel)

```bash
npx skills add alvarovillalbaa/agent-suite
# Optional: install one skill only
npx skills add alvarovillalbaa/agent-suite --skill fundraising
```

Installs the repo as a skill collection; each folder under `skills/` with a `SKILL.md` is an installable skill.

### OpenClaw

```bash
# Workspace skills
git clone https://github.com/alvarovillalbaa/agent-suite.git ./skills/agent-suite

# Or user skills
git clone https://github.com/alvarovillalbaa/agent-suite.git ~/.openclaw/skills/agent-suite
```

Point OpenClaw at the `skills/` inside the clone, or copy individual skill folders. Restart or reload the runtime after install. If using ClawHub, `clawhub install` once the pack is registered.

## Configuration

Optional: create `.claude/agent-suite.local.md` (or equivalent in your environment) with team name, domains, and any overrides. See `templates/settings-template.md` if present.

## Quick start

1. Install via one of the methods above.
2. Try a command: `/agent-suite:slides` or `/agent-suite:video`, or ask the **content-manager** to draft a content brief.
3. For fundraising: `/agent-suite:fundraise` or invoke the **financial-manager** agent with fundraising context.

## Updating

- **Claude plugin (git clone):** `cd ~/.claude/plugins/agent-suite && git pull` or run `./scripts/update-from-upstream.sh` from the repo root. You can also run `./scripts/update.sh` to auto-detect install type and run the right update.
- **npx skills add:** Re-run `npx skills add alvarovillalbaa/agent-suite` to refresh installed skills.
- **OpenClaw:** `cd` into the cloned repo (e.g. `./skills/agent-suite` or `~/.openclaw/skills/agent-suite`) and run `git pull`; restart or reload the runtime.

## Architecture

```
agent-suite/
├── .claude-plugin/
│   └── plugin.json
├── agents/           # Orchestrators (content, financial, sales, social-media)
├── commands/         # /agent-suite:* slash commands
├── hooks/
│   └── hooks.json
├── skills/           # One folder per skill; canonical layout per skill:
│   └── <skill-name>/
│       ├── SKILL.md        # Main instructions
│       ├── references.md   # Index to references/
│       ├── references/     # Domain/legal/methodology docs
│       ├── examples/       # Example inputs/outputs
│       ├── templates/      # Schemas, doc templates
│       └── scripts/        # Optional validators/helpers
├── scripts/          # Shared hook scripts
└── templates/        # Optional settings template
```

See [docs/spec/skills.md](docs/spec/skills.md) for the full canonical skill layout and SKILL.md content template.

## License

MIT. See [LICENSE](LICENSE).
