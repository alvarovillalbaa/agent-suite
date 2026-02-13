#!/bin/bash
# Append a short session audit entry.
# Reads hook input JSON from stdin.

python3 - <<'PY'
import json
import os
import sys
from datetime import datetime

try:
    data = json.load(sys.stdin)
except Exception:
    data = {}

root = os.environ.get("CLAUDE_PROJECT_DIR", os.getcwd())
log_dir = os.path.join(root, "logs")
os.makedirs(log_dir, exist_ok=True)
log_path = os.path.join(log_dir, "session-audit.log")

entry = {
    "timestamp": datetime.utcnow().isoformat() + "Z",
    "event": "SessionEnd",
    "session_id": data.get("session_id") or data.get("sessionId"),
    "summary": data.get("summary") or "",
}

with open(log_path, "a", encoding="utf-8") as f:
    f.write(json.dumps(entry, ensure_ascii=True) + "\n")
PY
