# Engineering

Engineering workflows for implementation, QA, architecture, documentation, cloud operations, and technical risk.

## What lives here

- Skills: `agentic-development`, `ai-engineering`, `backend`, `frontend`, `cloud-management`, `pentest`, `pr-management`, `quality-assurance`, `code-documentation`
- Commands: `repo-review`, `docs-pass`
- Agents: `principal-engineer`

Use this plugin when the work is primarily technical and repo-grounded.

## Install

Install the whole plugin with `skills`:

```bash
npx -y skills add ./engineering
```

Install one skill into Codex manually:

```bash
mkdir -p ~/.codex/skills
cp -R engineering/skills/agentic-development ~/.codex/skills/
```

Use Codex `$skill-installer` against the plugin path:

```text
https://github.com/alvarovillalbaa/plugins/tree/main/engineering
```

## Skills

- [`agentic-development`](./skills/agentic-development/README.md): end-to-end repo execution and implementation workflow
- [`ai-engineering`](./skills/ai-engineering/README.md): data, ML, prompt, and AI systems work
- [`backend`](./skills/backend/README.md): APIs, services, schemas, persistence, and server-side operational work
- [`frontend`](./skills/frontend/README.md): browser-facing implementation, UI systems, and design-quality work
- [`cloud-management`](./skills/cloud-management/README.md): CLI-first AWS, Azure, and GCP operations
- [`pentest`](./skills/pentest/README.md): authorized offensive security validation
- [`pr-management`](./skills/pr-management/README.md): pull request process and review-system design
- [`quality-assurance`](./skills/quality-assurance/README.md): testing, debugging, review, and secure engineering
- [`code-documentation`](./skills/code-documentation/README.md): technical documentation and repo-writing workflows
