---
name: cancel-dev-loop
description: "Cancel an active agentic development loop by removing its state file."
allowed-tools: ["Bash(test -f .claude/agentic-dev-loop.local.md:*)", "Bash(rm .claude/agentic-dev-loop.local.md)", "Read(.claude/agentic-dev-loop.local.md)"]
hide-from-slash-command-tool: "true"
---

# Cancel Dev Loop

1. Check if an active loop exists:
   ```bash
   test -f .claude/agentic-dev-loop.local.md && echo "EXISTS" || echo "NOT_FOUND"
   ```

2. **If NOT_FOUND**: say "No active dev loop found."

3. **If EXISTS**:
   - Read `.claude/agentic-dev-loop.local.md` to get the current `iteration:` value from the frontmatter.
   - Remove the state file:
     ```bash
     rm .claude/agentic-dev-loop.local.md
     ```
   - Report: "Cancelled agentic dev loop (was at iteration N)."
