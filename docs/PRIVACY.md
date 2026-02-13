# Privacy and Data Handling

This plugin is designed to run locally within Claude Code. It does not transmit data externally unless you explicitly invoke tools that access external services.

## MCP Servers

The plugin declares two remote MCP servers:

- `https://mcp.clous.app/hr`
- `https://mcp.clous.app/employee`

If you use skills or agents that call these MCP tools, data sent to those endpoints depends on the specific tool request. Consult your internal policies before sending employee data.

### Authentication

If your MCP servers require authentication, configure headers or tokens through environment variables as documented by your MCP client/server contract. Do not hardcode secrets in this repo.

## Web Search

If a skill or agent uses WebSearch, prompts may include role titles, location, and compensation context. Avoid sharing personal identifiers.

## Local Files

- Settings are stored in `.claude/clous-hreng.local.md`
- Logs (if enabled) are stored in `~/.claude/clous-hreng/logs`

## Legal Disclaimer

This plugin provides guidance, not legal advice. Always consult HR and legal counsel for decisions involving hiring, compensation, or termination.
