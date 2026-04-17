# Learning System

Learning-system workflows for memory, self-improvement, and durable knowledge management.

## What lives here

- Skills: `auto-improve`, `memory-management`, `second-brain`
- Commands: `learning-sync`

Use this plugin when the goal is to preserve context across sessions, improve the system over time, or build a reusable knowledge base.

## Install

Install the whole plugin with `skills`:

```bash
npx -y skills add ./learning-system
```

Install one skill into Codex manually:

```bash
mkdir -p ~/.codex/skills
cp -R learning-system/skills/second-brain ~/.codex/skills/
```

Use Codex `$skill-installer` against the plugin path:

```text
https://github.com/alvarovillalbaa/plugins/tree/main/learning-system
```

## Skills

- [`auto-improve`](./skills/auto-improve/README.md): audit and improve memories, docs, and workflows
- [`memory-management`](./skills/memory-management/README.md): human-written stub for the repo's memory-management slot
- [`second-brain`](./skills/second-brain/README.md): build and maintain a storage-agnostic knowledge base
