#!/bin/bash
# Validate plugin structure and components

set -euo pipefail

echo "🔍 Validating Clous HR Engineering Plugin"
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

# Check skills
SKILL_COUNT=$(find skills -name "SKILL.md" | wc -l | tr -d ' ')
echo "✅ Found $SKILL_COUNT skills"

if [ "$SKILL_COUNT" -ne 10 ]; then
    echo "⚠️  Expected 10 skills, found $SKILL_COUNT"
    WARNINGS=$((WARNINGS + 1))
fi

# Check commands
CMD_COUNT=$(find commands -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
echo "✅ Found $CMD_COUNT commands"

# Check agents
AGENT_COUNT=$(find agents -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
echo "✅ Found $AGENT_COUNT agents"

if [ "$AGENT_COUNT" -ne 3 ]; then
    echo "⚠️  Expected 3 agents, found $AGENT_COUNT"
    WARNINGS=$((WARNINGS + 1))
fi

# Check hooks
if [ -f "hooks/hooks.json" ]; then
    echo "✅ Hooks configuration found"
else
    echo "⚠️  No hooks configuration"
    WARNINGS=$((WARNINGS + 1))
fi

# Check for SKILL.md frontmatter and skeleton

echo ""
echo "📋 Checking skill structure..."
for skill in skills/*; do
    if [ ! -d "$skill" ]; then
        continue
    fi
    name=$(basename "$skill")

    if [[ "$name" != hreng-* ]]; then
        echo "  ❌ Skill does not use hreng- prefix: $name"
        ERRORS=$((ERRORS + 1))
    fi

    if [ -f "$skill/SKILL.md" ] && grep -q "^name:" "$skill/SKILL.md" && grep -q "^description:" "$skill/SKILL.md"; then
        echo "  ✅ $name"
    else
        echo "  ❌ Missing SKILL.md frontmatter: $name"
        ERRORS=$((ERRORS + 1))
    fi

    if [ ! -f "$skill/references.md" ]; then
        echo "  ❌ Missing references.md: $name"
        ERRORS=$((ERRORS + 1))
    fi

    if [ ! -d "$skill/templates" ] || [ -z "$(ls -A "$skill/templates" 2>/dev/null)" ]; then
        echo "  ❌ Missing or empty templates/: $name"
        ERRORS=$((ERRORS + 1))
    fi

    if [ ! -d "$skill/examples" ] || [ -z "$(ls -A "$skill/examples" 2>/dev/null)" ]; then
        echo "  ❌ Missing or empty examples/: $name"
        ERRORS=$((ERRORS + 1))
    fi

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
