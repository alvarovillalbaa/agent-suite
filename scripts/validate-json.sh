#!/bin/bash
# Validate JSON outputs and optionally validate against a schema.
# Reads hook input JSON from stdin.

python3 - <<'PY'
import importlib.util
import json
import os
import sys
from pathlib import Path

try:
    data = json.load(sys.stdin)
except Exception:
    sys.exit(0)

file_path = data.get("tool_input", {}).get("file_path") or data.get("tool_input", {}).get("path") or ""
if not file_path or not file_path.endswith(".json"):
    sys.exit(0)

path = Path(file_path)
if not path.is_file():
    sys.exit(0)

try:
    with path.open("r", encoding="utf-8") as f:
        payload = json.load(f)
except Exception as exc:
    print(f"Invalid JSON: {path} ({exc})")
    sys.exit(2)

schema_path = os.environ.get("JSON_SCHEMA", "").strip()
if not schema_path:
    candidate = path.with_suffix(".schema.json")
    if candidate.is_file():
        schema_path = str(candidate)

if not schema_path:
    sys.exit(0)

schema_file = Path(schema_path)
if not schema_file.is_file():
    print(f"Schema file not found: {schema_path}")
    sys.exit(2)

if importlib.util.find_spec("jsonschema") is None:
    print("jsonschema not installed; skipping schema validation.")
    sys.exit(0)

try:
    import jsonschema
    with schema_file.open("r", encoding="utf-8") as f:
        schema = json.load(f)
    jsonschema.validate(instance=payload, schema=schema)
except Exception as exc:
    print(f"JSON schema validation failed: {schema_path} ({exc})")
    sys.exit(2)

sys.exit(0)
PY
