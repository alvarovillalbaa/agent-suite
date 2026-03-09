# Agent Suite

Portable business and productivity workflows for AI agents: content, finance, sales, research, social, slides, and video.

This repo is structured so people can use it in multiple ways:

- As a Claude Code plugin
- As a skill collection via Vercel's `npx skills`
- In Codex
- In OpenClaw
- By cloning the repo and loading it manually
- By copying only the folders you want with shell scripts
- By installing only individual skills, agents, or commands

## What is in this repo

### Skills

| Skill | Purpose |
|-------|---------|
| `accounting-reconciliation` | Match books, statements, and ledgers; flag discrepancies |
| `agentic-development` | General repository execution workflow |
| `blog-articles` | Draft and structure blog posts |
| `cloud-management` | Cross-cloud CLI-first operations |
| `code-documentation` | Technical docs and reports |
| `code-slides` | Code-based slide decks, HTML presentations, PPT-to-web conversion |
| `competitors` | Competitive intel and positioning |
| `content-syndication` | Repurpose and distribute content across channels |
| `continuous-learning` | Capture lessons and reusable knowledge |
| `email-inbox-management` | Email triage, replies, and inbox workflows |
| `financial-modeling` | Build and review financial models |
| `fundraising` | Investor messaging, materials upgrade, process diagnostics |
| `linkedin-articles` | LinkedIn long-form articles |
| `linkedin-engagement` | LinkedIn comments, DMs, and engagement |
| `message-outreach` | Outreach and sales messaging |
| `prospect-research` | Prospect and account research |
| `quality-assurance` | QA and testing workflows |
| `seo-and-geo` | SEO, GEO, and AEO optimization |
| `suite-router` | Route intent to the right agent or skill |
| `video-generation` | Programmatic video workflows |
| `visualizer` | Visual explainers, reviews, dashboards, and slide-mode HTML |
| `x-articles` | X long-form articles |
| `x-engagement` | X replies, quote posts, DMs, and engagement |

### Agents

| Agent | Scope |
|-------|-------|
| `content-manager` | Content planning, drafting, and distribution |
| `financial-manager` | Reconciliation, modeling, and fundraising |
| `sales-manager` | Prospect research, outreach, and competitor analysis |
| `social-media-manager` | LinkedIn and X content plus engagement |
| `visual-manager` | Visual explainers, decks, and video outputs |
| `swe` | Software engineering orchestration |

### Commands

These are repo-provided command entry points, primarily useful in Claude-style plugin environments:

| Command | Purpose |
|---------|---------|
| `content-brief` | Build a reusable content brief |
| `blog-draft` | Draft a canonical blog article |
| `social-pack` | Repurpose a canonical piece across social channels |
| `account-brief` | Build a focused account or prospect brief |
| `outreach` | Research and draft outreach messages |
| `competitor-scan` | Scan competitor or market moves |
| `linkedin-engage` | Draft LinkedIn comments or DMs |
| `x-engage` | Draft X replies, quote posts, or DMs |
| `inbox-triage` | Triage inbound email threads and draft replies |
| `reconcile-books` | Reconcile statements, receipts, and ledgers |
| `model-scenarios` | Build or review a financial model with scenarios |
| `investor-messaging` | Draft the fundraising narrative and investor hooks |
| `materials-audit` | Audit deck, model, or data room quality |
| `pipeline-diagnostics` | Diagnose fundraising funnel health and next steps |
| `visualize` | Turn source material into a visual HTML artifact |
| `repo-review` | Run a findings-first engineering review |
| `docs-pass` | Update technical documentation close to the code |
| `learning-sync` | Capture durable engineering lessons |
| `help` | List suite capabilities |
| `slides` | Slides workflow entry point |
| `video` | Video workflow entry point |

## Install

### Install matrix

| Method | Best for | Installs |
|--------|----------|----------|
| Claude Code plugin | Full repo with commands, hooks, agents, and skills | Full plugin |
| `npx skills` | Cross-agent skill install | Skills only |
| Codex manual install | One skill or a small set of skills | Skills only |
| Codex `$skill-installer` | Direct GitHub skill install inside Codex | Individual skills |
| OpenClaw manual install | Local runtime skill folders | Skills, optionally agents/commands |
| Git clone | Local development, forking, direct loading | Everything |
| Symlink / shell copy | Selective local installs | Individual folders |
| Sparse checkout | Pull only specific folders from Git | Individual folders |

## 1. Claude Code Plugin

Use this when you want the full repo: plugin metadata, commands, hooks, agents, and skills.

### Local development

```bash
claude --plugin-dir /absolute/path/to/agent-suite
```

### Persistent install

```bash
mkdir -p ~/.claude/plugins
git clone https://github.com/alvarovillalbaa/agent-suite.git ~/.claude/plugins/agent-suite
```

### Update

```bash
cd ~/.claude/plugins/agent-suite && git pull
```

## 2. Vercel `npx skills`

Use this when you want portable skill installation across supported agents.

### Install all skills

```bash
npx -y skills add alvarovillalbaa/agent-suite
```

### Install all skills globally

```bash
npx -y skills add -g alvarovillalbaa/agent-suite
```

### Install for a specific agent

```bash
npx -y skills add -a codex alvarovillalbaa/agent-suite
npx -y skills add -a claude-code alvarovillalbaa/agent-suite
```

### Install only selected skills

```bash
npx -y skills add alvarovillalbaa/agent-suite --skill fundraising
npx -y skills add alvarovillalbaa/agent-suite --skill blog-articles --skill seo-and-geo
```

### Install from local path

```bash
npx -y skills add ./agent-suite
```

## 3. Codex

You have two practical options: install through `npx skills` targeting Codex, or install an individual skill directly.

### Option A: install through `npx skills`

```bash
npx -y skills add -a codex alvarovillalbaa/agent-suite
```

### Option B: install a single skill manually

Copy a skill folder into your local Codex skills directory.

```bash
mkdir -p ~/.codex/skills
cp -R skills/fundraising ~/.codex/skills/
```

### Option C: install a single skill with Codex's skill installer

Inside Codex, use `$skill-installer` for built-in or repository-backed installs.

```text
$skill-installer
```

If you want a skill from this repo, prompt the installer to fetch the skill from:

```text
https://github.com/alvarovillalbaa/agent-suite/tree/main/skills/<skill-name>
```

## 4. OpenClaw

OpenClaw users can clone the repo and point the runtime at the `skills/` directory, or copy individual folders.

### Full clone

```bash
mkdir -p ~/.openclaw/skills
git clone https://github.com/alvarovillalbaa/agent-suite.git ~/.openclaw/skills/agent-suite
```

### Individual skill copy

```bash
mkdir -p ~/.openclaw/skills
cp -R skills/code-slides ~/.openclaw/skills/
```

Reload the runtime after install.

## 5. Git clone

Use this when you want the repo locally for development, inspection, or manual loading in any AI OS.

```bash
git clone https://github.com/alvarovillalbaa/agent-suite.git
cd agent-suite
```

From there you can:

- Load the full repo as a plugin if your runtime supports plugins
- Point your runtime at `skills/`
- Copy only `agents/`, `commands/`, or selected skills
- Symlink folders into a local skill registry

## 6. Install with shell scripts

Use plain `sh` commands if you want repeatable installs without a marketplace.

### Copy one skill

```sh
mkdir -p "$HOME/.codex/skills"
cp -R skills/seo-and-geo "$HOME/.codex/skills/"
```

### Copy several skills

```sh
mkdir -p "$HOME/.codex/skills"
for skill in blog-articles seo-and-geo content-syndication; do
  cp -R "skills/$skill" "$HOME/.codex/skills/"
done
```

### Symlink for local development

```sh
mkdir -p "$HOME/.codex/skills"
ln -s "$(pwd)/skills/fundraising" "$HOME/.codex/skills/fundraising"
```

## 7. Install only individual skills

Every folder under `skills/` is installable on its own.

Examples:

```bash
cp -R skills/fundraising ~/.codex/skills/
cp -R skills/code-slides ~/.openclaw/skills/
npx -y skills add alvarovillalbaa/agent-suite --skill x-articles
```

## 8. Install only individual agents

If your runtime supports agent files, copy only the agent you want from `agents/`.

Examples:

```bash
cp agents/content-manager.md /path/to/your/agents/
cp agents/sales-manager.md /path/to/your/agents/
```

The agent files reference skills by logical name, so the corresponding skills should also be available in that runtime.

## 9. Install only individual commands

If your runtime supports command markdown files, copy only the files you need from `commands/`.

Examples:

```bash
cp commands/investor-messaging.md /path/to/your/commands/
cp commands/slides.md /path/to/your/commands/
```

Command support is runtime-specific. In some environments, commands are ignored while skills still work.

## 10. Sparse checkout for partial clone

Use sparse checkout if you want only one part of the repo without pulling everything.

### One skill

```bash
git clone --filter=blob:none --no-checkout https://github.com/alvarovillalbaa/agent-suite.git
cd agent-suite
git sparse-checkout init --cone
git sparse-checkout set skills/fundraising
git checkout main
```

### Only agents and commands

```bash
git clone --filter=blob:none --no-checkout https://github.com/alvarovillalbaa/agent-suite.git
cd agent-suite
git sparse-checkout init --cone
git sparse-checkout set agents commands
git checkout main
```

## 11. Other compatible approaches

Depending on the runtime, these also work:

- Install from a local path after cloning the repo
- Use symlinks instead of copies for local development
- Fork the repo and install from your own GitHub namespace
- Vendor specific `skills/<name>` folders into another repo
- Use the repo as a template for your own internal skill pack

## Quick start

### If you installed the full plugin

- Try `content-manager` for multi-channel content work
- Try `financial-manager` for modeling or fundraising
- Try `sales-manager` for research and outreach
- Try `social-media-manager` for LinkedIn and X workflows
- Try `visual-manager` for explainers, decks, and video

### If you installed individual skills

Good entry points:

- `suite-router`
- `visualize`
- `fundraising`
- `repo-review`
- `code-slides`
- `blog-articles`
- `prospect-research`
- `seo-and-geo`

## Repository layout

```text
agent-suite/
├── .claude-plugin/
│   └── plugin.json
├── agents/
├── commands/
├── docs/
├── hooks/
├── scripts/
├── skills/
│   └── <skill-name>/
│       ├── SKILL.md
│       ├── references/
│       ├── examples/
│       ├── templates/
│       └── scripts/
└── templates/
```

## Notes

- Skills are the most portable unit in this repo.
- Agents are portable when the target runtime supports agent files.
- Commands and hooks are the least portable because support varies by runtime.
- Repo-specific integration notes live in [docs/agent-suite-integration.md](docs/agent-suite-integration.md).

## License

MIT. See [LICENSE](LICENSE).
