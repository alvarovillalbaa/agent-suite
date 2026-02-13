#!/bin/bash
# Deny destructive shell commands by default.
# Reads hook input JSON from stdin.

python3 - <<'PY'
import json
import re
import sys

def dig(d, *keys):
    cur = d
    for key in keys:
        if isinstance(cur, dict) and key in cur:
            cur = cur[key]
        else:
            return ""
    return cur if isinstance(cur, str) else ""

try:
    data = json.load(sys.stdin)
except Exception:
    sys.exit(0)

candidates = [
    dig(data, "tool_input", "command"),
    dig(data, "permission_request", "tool_input", "command"),
    dig(data, "permission_request", "command"),
    dig(data, "command"),
]
command = next((c for c in candidates if c), "").strip()
if not command:
    sys.exit(0)

patterns = [
    (r"\brm\s+-rf\b", "rm -rf"),
    (r"\brm\s+-fr\b", "rm -fr"),
    (r"\brm\s+-r\b\s*/\b", "rm -r /"),
    (r"\brm\b.*\s+/\b", "rm /"),
    (r"\bgit\s+push\s+--force\b", "git push --force"),
    (r"\bgit\s+push\s+-f\b", "git push -f"),
    (r"\bchmod\s+-R\s+777\b", "chmod -R 777"),
    (r"\bchown\s+-R\b", "chown -R"),
    (r"\bdd\s+if=", "dd if="),
    (r"\bmkfs\.[a-z0-9]+\b", "mkfs.*"),
    (r":\s*\(\)\s*\{\s*:\s*\|\s*:\s*&\s*\}\s*;\s*:", "fork bomb"),
]

for pattern, label in patterns:
    if re.search(pattern, command):
        print(f"Denied: destructive command pattern detected ({label}).")
        sys.exit(2)

sys.exit(0)
PY
