#!/usr/bin/env bash
# Update agent-suite from upstream. Detects install context and runs the appropriate update.
# Run from the agent-suite repo root (e.g. ~/.claude/plugins/agent-suite or ./skills/agent-suite).

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Not a git repository. Cannot update."
  exit 1
fi

# If we're inside a clone that looks like a plugin dir (has .claude-plugin and agents/), do git pull
if [ -d "${REPO_ROOT}/.claude-plugin" ] && [ -d "${REPO_ROOT}/agents" ]; then
  echo "Detected agent-suite plugin install. Pulling latest..."
  git fetch origin
  git pull origin main
  echo "Update complete. Restart Claude Code or reload the plugin to use the latest version."
  exit 0
fi

# If we're in a bare skills clone (only skills/ matters to the user), still try git pull
if [ -d "${REPO_ROOT}/skills" ]; then
  echo "Detected agent-suite skills tree. Pulling latest..."
  git fetch origin
  git pull origin main
  echo "Update complete. Restart or reload your runtime (OpenClaw, etc.) if needed."
  exit 0
fi

# Unknown layout: print one-liners for each install method
echo "Could not detect install type. Use one of the following:"
echo ""
echo "  Claude plugin (git clone):  cd ~/.claude/plugins/agent-suite && git pull"
echo "  npx skills add:               npx skills add alvarovillalbaa/agent-suite"
echo "  OpenClaw:                    cd <path-to-clone> && git pull"
exit 1
