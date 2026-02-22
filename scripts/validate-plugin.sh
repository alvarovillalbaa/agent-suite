#!/usr/bin/env bash
# Validate plugin structure and components.
# Requires: .claude-plugin/plugin.json, skills/*/SKILL.md with name + description.
# Optional per skill: references.md, templates/, examples/.

set -euo pipefail

PLUGIN_NAME="Agent Suite Plugin"
if [ -f ".claude-plugin/plugin.json" ]; then
  if command -v jq >/dev/null 2>&1; then
    PLUGIN_NAME=$(jq -r '.name // "Agent Suite Plugin"' .claude-plugin/plugin.json 2>/dev/null)
  fi
fi

echo "🔍 Validating $PLUGIN_NAME"
echo ""

ERRORS=0
WARNINGS=0

# Check plugin.json exists
if [ -f ".claude-plugin/plugin.json" ]; then
  echo "✅ Plugin manifest found"
else
  echo "❌ Missing .claude-plugin/plugin.json"
  ERRORS=$((ERRORS + 1))
fi

# Check skills (only folders with SKILL.md count)
SKILL_COUNT=0
for skill in skills/*/; do
  [ -d "$skill" ] || continue
  [ -f "${skill}SKILL.md" ] && SKILL_COUNT=$((SKILL_COUNT + 1))
done
echo "✅ Found $SKILL_COUNT skills"

# Check commands
CMD_COUNT=$(find commands -maxdepth 1 -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
echo "✅ Found $CMD_COUNT commands"

# Check agents
AGENT_COUNT=$(find agents -maxdepth 1 -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
echo "✅ Found $AGENT_COUNT agents"

# Check hooks
if [ -f "hooks/hooks.json" ]; then
  echo "✅ Hooks configuration found"
else
  echo "⚠️  No hooks configuration"
  WARNINGS=$((WARNINGS + 1))
fi

# Check skill structure: only SKILL.md with name + description required
echo ""
echo "📋 Checking skill structure..."
for skill in skills/*/; do
  [ -d "$skill" ] || continue
  name=$(basename "$skill")

  if [ ! -f "$skill/SKILL.md" ]; then
    echo "  ❌ Missing SKILL.md: $name"
    ERRORS=$((ERRORS + 1))
    continue
  fi

  if grep -q "^name:" "$skill/SKILL.md" && grep -q "^description:" "$skill/SKILL.md"; then
    echo "  ✅ $name"
  else
    echo "  ❌ Missing name/description frontmatter in SKILL.md: $name"
    ERRORS=$((ERRORS + 1))
  fi

  # Optional: references, templates, examples (inform only, no error)
  [ -f "$skill/references.md" ] || [ -d "$skill/references" ] || true
  [ -d "$skill/templates" ] && [ -n "$(ls -A "$skill/templates" 2>/dev/null)" ] || true
  [ -d "$skill/examples" ] && [ -n "$(ls -A "$skill/examples" 2>/dev/null)" ] || true
done

# Summary
echo ""
echo "═══════════════════════════════════════"
if [ $ERRORS -eq 0 ]; then
  echo "✅ Validation passed ($WARNINGS warnings)"
  exit 0
else
  echo "❌ Validation failed ($ERRORS errors, $WARNINGS warnings)"
  exit 1
fi
