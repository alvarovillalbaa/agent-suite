# Architecture

This plugin separates skills, agents, hooks, and MCP servers for clarity.

```
User Prompt
   |
   v
Agents (hreng-hiring / hreng-performance / hreng-org)
   |   \ 
   |    \__ assemble templates
   |
   v
Skills (hreng-*)  ---> examples/ + templates/ + references.md
   |
   v
Outputs (JSON/Markdown)

Hooks (PreToolUse/PostToolUse/UserPromptSubmit)
   ^
   |
   +-- run automatically on events

MCP Servers (remote)
   ^
   |
   +-- optional tool calls when enabled
```

## Responsibilities

- **Skills**: Single-purpose commands with defined inputs/outputs
- **Agents**: Orchestrators that select and sequence skills
- **Hooks**: Event listeners that run automatically
- **MCP**: External tools for HR or employee systems
