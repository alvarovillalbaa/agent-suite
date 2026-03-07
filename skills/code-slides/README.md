# code-slides skill

`code-slides` is an agent skill for building responsive, code-based slide decks and single-file HTML presentations with visual preset exploration, PPT-to-web conversion guidance, configurable navigation placement, and multi-source image workflows.

## Install with Vercel Skills CLI

```bash
npx skills add https://github.com/<owner>/code-slides
```

Select `code-slides` when prompted.

## Install from git clone

```bash
git clone https://github.com/<owner>/code-slides.git
cd code-slides/skills/code-slides
./scripts/install_local.sh --agent all
```

Use `--dry-run` first if you want to preview target paths.

## Manual skill folders

- Codex: `~/.codex/skills/code-slides`
- Claude Code: `~/.claude/skills/code-slides`
- OpenClaw: `~/.openclaw/skills/code-slides` (older installs may use `~/.moltbot/skills/code-slides`)

## Repository layout

- `skills/code-slides/SKILL.md`: Skill instructions and workflow.
- `skills/code-slides/references/`: Decision trees, style presets, viewport-fit, and implementation references.
- `skills/code-slides/scripts/`: Scaffolding, indexing, validation, and install automation.
- `skills/code-slides/assets/templates/`: HTML and React/TS starter templates.
- `skills/code-slides/templates/`: Planning and implementation prompt templates.
