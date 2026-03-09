# Architecture

This plugin separates skills, commands, agents, hooks, and optional external tooling so each layer has a clear job.

```text
User Prompt
   |
   v
Commands (narrow end-to-end automations)
   |
   v
Agents (multi-step orchestrators)
   |
   +--> sequence commands when a stable flow exists
   |
   +--> invoke skills directly for custom work
   |
   v
Skills (portable capability units)
   |
   +--> references / templates / scripts / assets
   |
   v
Outputs (code, docs, HTML, decks, reports, models)

Hooks
   ^
   |
   +--> lightweight routing, validation, and safety prompts

External tools / MCP
   ^
   |
   +--> optional runtime-specific integrations
```

## Responsibilities

- **Skills**: Portable capability units with a clear input/output shape.
- **Commands**: Narrow automations that run one skill or a well-defined slice of a workflow end-to-end.
- **Agents**: Orchestrators that decide which commands or skills to sequence for broader workflows.
- **Hooks**: Event-driven prompts or checks that improve routing, safety, and output quality.
- **External tools / MCP**: Optional integrations that expand what the runtime can access.

## Design principle

Prefer the smallest layer that can solve the task cleanly:

1. Use a **skill** when the user needs a capability.
2. Use a **command** when the workflow is stable and repeatable.
3. Use an **agent** when the work spans multiple commands or skills.
