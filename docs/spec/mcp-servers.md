In Claude Code **there’s no required `mcp/` folder**.

What matters is **one file at the plugin root**:

* `./.mcp.json` **or**
* an inline `"mcpServers": { ... }` block in `./.claude-plugin/plugin.json`

And then *you* choose where the actual server code/binary lives (docs commonly use `servers/`). ([Claude Code][1])

---

## Recommended plugin layout (with bundled MCP server)

```
my-plugin/
├── .claude-plugin/
│   └── plugin.json
├── .mcp.json
├── servers/
│   └── clous-hr/
│       ├── dist/
│       │   └── server.js
│       ├── package.json
│       └── README.md
└── skills/
    └── hiring-intake/
        └── SKILL.md
```

Why `servers/`? It’s the convention shown in Claude Code’s plugin docs, and it keeps “executable stuff” clearly separated from skills/content. ([Claude Code][1])

---

## `.mcp.json` example (points to your bundled server)

This is the **standard** format Claude Code expects in plugins:

```json
{
  "mcpServers": {
    "clous-hr": {
      "command": "node",
      "args": ["${CLAUDE_PLUGIN_ROOT}/servers/clous-hr/dist/server.js"],
      "cwd": "${CLAUDE_PLUGIN_ROOT}",
      "env": {
        "CLOUS_API_URL": "${CLOUS_API_URL}",
        "CLOUS_API_KEY": "${CLOUS_API_KEY}"
      }
    }
  }
}
```

Key rules:

* Use `${CLAUDE_PLUGIN_ROOT}` for plugin-relative paths. ([Claude Code][1])
* Plugin MCP servers **start automatically when the plugin is enabled**. ([Claude Code][2])

---

## If you *insist* on an `mcp/` folder

You can do it—Claude Code doesn’t care about the folder name. Just point `.mcp.json` to it:

```
my-plugin/
├── .mcp.json
├── mcp/
│   └── clous-hr-server.js
...
```

```json
{
  "mcpServers": {
    "clous-hr": {
      "command": "node",
      "args": ["${CLAUDE_PLUGIN_ROOT}/mcp/clous-hr-server.js"]
    }
  }
}
```

But again: docs/examples lean toward `servers/`. ([Claude Code][1])

---

## Alternative: don’t bundle code, run a published server via `npx`

Useful if you ship the MCP server as an npm package:

```json
{
  "mcpServers": {
    "clous-hr": {
      "command": "npx",
      "args": ["-y", "@clousai/mcp-hr", "--mode", "plugin"],
      "cwd": "${CLAUDE_PLUGIN_ROOT}"
    }
  }
}
```

This pattern is also shown in the plugin docs. ([Claude Code][1])
Tradeoff: it depends on network + supply chain trust.

---

**Reflection question:** do you want your Clous plugin to ship **real tools** (MCP server that can call Clous / ATS / HRIS APIs), or stay **instruction-only** (skills that output strict HR artifacts like JSON scorecards/intake briefs)?

[1]: https://code.claude.com/docs/en/plugins-reference "Plugins reference - Claude Code Docs"
[2]: https://code.claude.com/docs/en/mcp "Connect Claude Code to tools via MCP - Claude Code Docs"
