# Distribution and Installation

Package this skill so users can adopt it through tooling or manual install.

## Vercel Skills CLI (`npx skills add`)

Use repository URLs that contain `skills/code-slides/SKILL.md`.

```bash
npx skills add https://github.com/<owner>/<repo>
```

If the CLI shows multiple skills, select `code-slides`.

## Git Clone + Manual Install

```bash
git clone https://github.com/<owner>/<repo>.git
cd <repo>
```

Copy `skills/code-slides` into agent-specific skill directories.

- Codex: `~/.codex/skills/code-slides`
- Claude Code: `~/.claude/skills/code-slides`
- OpenClaw: `~/.openclaw/skills/code-slides` (older setups may use `~/.moltbot/skills/code-slides`)

Use `scripts/install_local.sh` to automate local copy after clone.

## Validation

Run skill validation before publishing:

```bash
python3 /Users/alvipe/.codex/skills/.system/skill-creator/scripts/quick_validate.py skills/code-slides
```

## Publishing Checklist

1. Confirm `SKILL.md` frontmatter is valid.
2. Confirm `agents/openai.yaml` is up to date.
3. Confirm scripts run with `python3`/`bash` without external assumptions.
4. Confirm template assets include both HTML default and React/TS explicit-mode starters.
