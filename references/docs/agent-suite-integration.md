# Agent-Suite Integration

This document is intentionally repo-specific.

Use it for integration details that should not live inside portable `SKILL.md` files or agent instructions.

## Repo-Specific Commands

The repository currently uses these shortcut commands in some entry points and external tooling:

- `/agent-suite:content-brief`
- `/agent-suite:blog-draft`
- `/agent-suite:social-pack`
- `/agent-suite:account-brief`
- `/agent-suite:outreach`
- `/agent-suite:competitor-scan`
- `/agent-suite:linkedin-engage`
- `/agent-suite:x-engage`
- `/agent-suite:inbox-triage`
- `/agent-suite:reconcile-books`
- `/agent-suite:model-scenarios`
- `/agent-suite:investor-messaging`
- `/agent-suite:materials-audit`
- `/agent-suite:pipeline-diagnostics`
- `/agent-suite:visualize`
- `/agent-suite:repo-review`
- `/agent-suite:docs-pass`
- `/agent-suite:learning-sync`
- `/agent-suite:slides`
- `/agent-suite:video`
- `/agent-suite:help`

Treat these as convenience wrappers around the underlying agents and skills, not as part of the portable skill contract.

## Project Context Files

If you want repository-local defaults, keep them in project context files rather than embedding them in generic skills.

Examples:

- Brand voice and publishing defaults
- Product context and ICP/ICA scorecards
- Finance defaults such as currency or chart of accounts

This repo has previously used assistant-specific context files such as `.claude/agent-suite.local.md`. Keep that kind of path here, not in portable skills.

## Local Skill Registry Examples

Some assistant runtimes support a local skill registry. The exact path depends on the runtime.

Examples previously used in this repo included locations under:

- `~/.codex/skills/`
- `~/.claude/skills/`
- `~/.openclaw/skills/`
- `~/.moltbot/skills/`

Do not treat those paths as universal. They are runtime-specific examples only.

## Code-Slides Notes

`skills/code-slides/` includes helper scripts such as `install_local.sh`. Use them only when your local runtime supports that installation flow.

If you maintain a repo-specific validator command or publishing workflow, document it here instead of hardcoding user-specific absolute paths in skill references.
