#!/bin/bash
# Learning System — Error Capture Hook
# Fires on PostToolUse (Bash) to detect command failures.
# Zero output on success — only produces output when errors are detected.
#
# Registered automatically when the plugin is installed via the hooks.json
# in this directory. To wire manually into .claude/settings.json:
#
#   "hooks": {
#     "PostToolUse": [{
#       "matcher": "Bash",
#       "hooks": [{"type": "command", "command": "${CLAUDE_PLUGIN_ROOT}/hooks/error-capture.sh"}]
#     }]
#   }

set -e

OUTPUT="${CLAUDE_TOOL_OUTPUT:-}"

# Exit silently if no output or empty
[ -z "$OUTPUT" ] && exit 0

# Error patterns — ordered by specificity
ERROR_PATTERNS=(
    "error:"
    "Error:"
    "ERROR:"
    "FATAL:"
    "fatal:"
    "FAILED"
    "failed"
    "command not found"
    "No such file or directory"
    "Permission denied"
    "Module not found"
    "ModuleNotFoundError"
    "ImportError"
    "SyntaxError"
    "TypeError"
    "ReferenceError"
    "Cannot find module"
    "ENOENT"
    "EACCES"
    "ECONNREFUSED"
    "ETIMEDOUT"
    "npm ERR!"
    "pnpm ERR!"
    "Traceback (most recent call last)"
    "panic:"
    "segmentation fault"
    "core dumped"
    "exit code"
    "non-zero exit"
    "Build failed"
    "Compilation failed"
    "Test failed"
)

# False positive exclusions — don't trigger on these
EXCLUSIONS=(
    "error-capture"       # Don't trigger on ourselves
    "error_handler"       # Code that handles errors
    "errorHandler"
    "error.log"           # Log file references
    "console.error"       # Code that logs errors
    "catch (error"        # Error handling code
    "catch (err"
    ".error("             # Logger calls
    "no error"            # Absence of error
    "without error"
    "error-free"
)

# Check exclusions first
for excl in "${EXCLUSIONS[@]}"; do
    if [[ "$OUTPUT" == *"$excl"* ]]; then
        exit 0
    fi
done

# Check for error patterns
contains_error=false
matched_pattern=""
for pattern in "${ERROR_PATTERNS[@]}"; do
    if [[ "$OUTPUT" == *"$pattern"* ]]; then
        contains_error=true
        matched_pattern="$pattern"
        break
    fi
done

# Exit silently if no error
[ "$contains_error" = false ] && exit 0

# Extract relevant error context (first 2 lines containing the pattern)
error_context=$(echo "$OUTPUT" | grep -i -m 5 "$matched_pattern" | head -2 | tr '\n' ' ' | cut -c1-200)

# Output a concise reminder — ~40 tokens
cat << EOF
<error-detected>
Command error detected (pattern: "$matched_pattern").
If this required investigation to fix, save the solution:
  /si:remember "what went wrong and the fix"
Context: $error_context
</error-detected>
EOF
