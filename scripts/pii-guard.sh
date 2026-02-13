#!/bin/bash
# Block writes that appear to contain PII or sensitive HR data.
# Reads hook input JSON from stdin.

python3 - <<'PY'
import json
import os
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

content = dig(data, "tool_input", "content") or dig(data, "tool_input", "new_content")
file_path = dig(data, "tool_input", "file_path") or dig(data, "tool_input", "path")

if not content and file_path and os.path.isfile(file_path):
    try:
        with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
            content = f.read()
    except Exception:
        content = ""

if not content:
    sys.exit(0)

checks = [
    ("SSN", re.compile(r"\b\d{3}-\d{2}-\d{4}\b")),
    ("SSN label", re.compile(r"(ssn|social\s+security)\D{0,10}\d{9,11}", re.I)),
    ("Routing number", re.compile(r"routing\s+number\D{0,10}\d{9}", re.I)),
    ("Bank account", re.compile(r"(account\s+number|acct\.?\s*#?)\D{0,10}\d{6,17}", re.I)),
    ("DOB", re.compile(r"\b(dob|date\s+of\s+birth)\D{0,10}\d{1,2}[/-]\d{1,2}[/-]\d{2,4}\b", re.I)),
    ("Street address", re.compile(r"\b\d{1,5}\s+\w+(\s+\w+){0,4}\s+(st|street|ave|avenue|rd|road|blvd|boulevard|ln|lane|dr|drive|ct|court)\b", re.I)),
]

for label, regex in checks:
    if regex.search(content):
        print(f"Blocked: potential PII detected ({label}). Please redact before writing.")
        sys.exit(2)

sys.exit(0)
PY
