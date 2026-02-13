#!/bin/bash
# Validates legal language in performance/feedback documents
# Usage: validate-legal-language.sh <file_path>

FILE="$1"

# Only validate specific file patterns
if [[ ! "$FILE" =~ (pip|feedback|performance|termination|warning) ]]; then
  exit 0
fi

# Check if file exists
if [ ! -f "$FILE" ]; then
  exit 0
fi

# Problematic phrases that could create legal issues
PROBLEMATIC_PHRASES=(
  "you're fired"
  "you will be fired"
  "guaranteed"
  "always fails"
  "never succeeds"
  "incompetent"
  "lazy"
  "attitude problem"
  "not a team player"
  "doesn't fit our culture"
)

FOUND_ISSUES=0

for phrase in "${PROBLEMATIC_PHRASES[@]}"; do
  if grep -qi "$phrase" "$FILE"; then
    echo "⚠️  WARNING: Potentially problematic legal language detected: '$phrase'"
    echo "   Consider rephrasing to focus on specific, observable behaviors."
    FOUND_ISSUES=1
  fi
done

if [ $FOUND_ISSUES -eq 0 ]; then
  echo "✓ No obvious legal language issues detected"
fi

exit 0
