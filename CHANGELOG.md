# Changelog

## [Unreleased]

### Added (comprehensive plan)

- **Canonical skill layout** – Every skill has `references.md`; fundraising has full structure (references/, templates/, examples/). See docs/spec/skills.md for the standard.
- **SKILL.md template** – Overview, When to Use, Inputs, Outputs, Core Process, Using Supporting Resources, Example Workflow, Next Steps, Validation checklist, Legal. All skills have `version: 1.0.0` in frontmatter; names aligned to folder (e.g. video-generation, slides-deck-generation).
- **suite-router skill** – Maps intent (content, slides, video, fundraising, finance, sales, outreach, research, competitors, social) to recommended command, agent, or skill. UserPromptSubmit hook uses this mapping for suggestions.
- **Agents** – Scope line and skills table per agent; README agents index (Agent | Scope | Skills).
- **Commands** – Standardised “Use skill: X — path” and argument-hint/allowed-tools; README command table with Skill(s) column.
- **Install/update** – README install table (Claude plugin, npx skills add, OpenClaw) with Update column; scripts/update.sh to auto-detect and run the right update.
- **Hooks** – UserPromptSubmit references suite-router mapping; README documents each hook purpose.

### Changed

- README: Architecture shows per-skill layout; Hooks section describes suite-router and each hook.
- QUICKSTART: One line per install method; Update points to README.

---

## [1.0.0] – 2025-02-22

### Added

- **Plugin manifest** – `.claude-plugin/plugin.json` for Claude Code discovery.
- **README** – Features, skills/commands/agents tables, install (Claude plugin, npx skills add, OpenClaw), configuration, quick start, update instructions.
- **Skills** – All skills use canonical layout with `SKILL.md` (frontmatter + instructions). Migrated from `v1/instruction.j2` where applicable: fundraising, competitors, industry-discovery, message-outreach, prospect-research. Filled minimal skills: accounting-reconciliation, briefings, financial-modeling, linkedin-articles, linkedin-engagement. Placeholders: email-inbox-management, x-engagement. Optional references.md for slides-deck-generation and video-generation.
- **Agents** – content-manager, financial-manager, sales-manager, social-media-manager filled as multi-skill orchestrators with workflow and skill mapping.
- **Commands** – video, slides, fundraise, content-brief, outreach, help (namespaced as `/agent-suite:*`).
- **Hooks** – Generalized for agent-suite (no Clous/HR-specific prompts); Bash guard, JSON validation, UserPromptSubmit/PostToolUse/Stop/SubagentStop/SessionStart/SessionEnd/PreCompact.
- **Docs** – QUICKSTART updated for agent-suite commands and agents; templates/settings-template.md; scripts/update-from-upstream.sh.
- **Validation** – scripts/validate-plugin.sh updated for agent-suite (no hreng- prefix; references/templates/examples optional).

### Changed

- session-start.sh now also loads `.claude/agent-suite.local.md`.
