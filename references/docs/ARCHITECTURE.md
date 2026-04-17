# Architecture

The repository is now a company package with department-level plugins instead of one monolithic plugin root.

```text
Company Root
├── .claude-plugin/marketplace.json
├── COMPANY.md
├── assets/
├── scripts/
├── references/
└── Department Plugins
    ├── learning-system/
    ├── marketing/
    ├── sales/
    ├── engineering/
    ├── product/
    └── business-ops/
```

## Department plugin contract

Each department is its own portable plugin surface for Claude, Codex, and Cursor.

```text
department/
├── .claude-plugin/plugin.json
├── .codex-plugin/plugin.json
├── .cursor-plugin/plugin.json
├── TEAM.md
├── profile.yaml
├── skills/
├── agents/
├── commands/
├── hooks/
└── scripts/
```

## Responsibilities

- **Company root**: company narrative, marketplace catalog, shared references, shared scripts, install guidance
- **Department plugin**: runtime-specific install surface plus the department's own skills, agents, commands, hooks, and metadata
- **Skills**: smallest portable capability unit
- **Commands**: stable end-to-end workflows
- **Agents**: orchestrators for multi-step or cross-artifact work

## Platform implications

- **Claude**: install department plugins through the root marketplace
- **Codex**: install a department by pointing Codex at that department directory
- **Cursor**: install a department by pointing Cursor at that department directory
- **Agent company**: clone the whole repository to preserve teams, departments, and cross-functional coordination
