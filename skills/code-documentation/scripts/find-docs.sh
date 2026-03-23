#!/usr/bin/env bash
# find-docs.sh — Locate documentation files relevant to the current task.
#
# Usage:
#   ./find-docs.sh            Print locations for common doc targets
#   ./find-docs.sh log        Print path to latest memory log
#   ./find-docs.sh audit      Print path for a new audit (today's date folder)
#   ./find-docs.sh service    Print service-level doc locations (requires being in a service dir)

set -euo pipefail

TODAY=$(date +%Y-%m-%d)
YEAR=$(date +%Y)
MONTH_DAY=$(date +%m-%d)
DOCS_ROOT="docs"

# Find repo root (walk up until we find a docs/ directory or .git)
find_repo_root() {
    local dir="$PWD"
    while [[ "$dir" != "/" ]]; do
        if [[ -d "$dir/docs" || -d "$dir/.git" ]]; then
            echo "$dir"
            return
        fi
        dir="$(dirname "$dir")"
    done
    echo "$PWD"
}

REPO_ROOT=$(find_repo_root)

print_separator() {
    echo "────────────────────────────────────────────────"
}

cmd="${1:-all}"

case "$cmd" in

    log)
        LOG_DIR="$REPO_ROOT/$DOCS_ROOT/memories/logs"
        if [[ -d "$LOG_DIR" ]]; then
            LATEST_YEAR=$(ls "$LOG_DIR" | sort | tail -1)
            LATEST_DAY=$(ls "$LOG_DIR/$LATEST_YEAR" 2>/dev/null | sort | tail -1)
            LATEST_FILE=$(ls "$LOG_DIR/$LATEST_YEAR/$LATEST_DAY" 2>/dev/null | sort | tail -1)
            echo "Latest log: $LOG_DIR/$LATEST_YEAR/$LATEST_DAY/$LATEST_FILE"
            echo ""
            echo "Append with:"
            echo "  echo '- Your log entry here' >> $LOG_DIR/$LATEST_YEAR/$LATEST_DAY/$LATEST_FILE"
        else
            echo "No docs/memories/logs/ directory found in repo root: $REPO_ROOT"
            echo "Create it with: mkdir -p $REPO_ROOT/$DOCS_ROOT/memories/logs/$YEAR/$MONTH_DAY"
            echo "Then create:    touch $REPO_ROOT/$DOCS_ROOT/memories/logs/$YEAR/$MONTH_DAY/dev.md"
        fi
        ;;

    audit)
        AUDIT_DIR="$REPO_ROOT/$DOCS_ROOT/audits/$YEAR/$MONTH_DAY"
        echo "New audit location: $AUDIT_DIR/"
        echo ""
        echo "Create with:"
        echo "  mkdir -p $AUDIT_DIR"
        echo "  touch $AUDIT_DIR/report-name.md"
        ;;

    service)
        # Look for the nearest service-level directory
        CURRENT="$PWD"
        echo "Service docs for: $CURRENT"
        echo ""
        echo "Expected files:"
        echo "  $CURRENT/README.md      — What it does, when to use it"
        echo "  $CURRENT/ARCHITECTURE.md — How it works internally"
        echo "  $CURRENT/TESTS.md       — Testing patterns"
        echo ""
        echo "Existing:"
        for f in README.md ARCHITECTURE.md TESTS.md SETUP.md OVERVIEW.md FAQ.md CHANGELOG.md; do
            if [[ -f "$CURRENT/$f" ]]; then
                echo "  ✓ $f"
            else
                echo "  ✗ $f (missing)"
            fi
        done
        ;;

    all|*)
        print_separator
        echo "Code Documentation — File Locations"
        print_separator
        echo ""

        # Memory logs
        LOG_DIR="$REPO_ROOT/$DOCS_ROOT/memories/logs"
        echo "📓 MEMORY LOGS (docs/memories/logs/YYYY/MM-DD/)"
        if [[ -d "$LOG_DIR" ]]; then
            LATEST_YEAR=$(ls "$LOG_DIR" 2>/dev/null | sort | tail -1)
            if [[ -n "$LATEST_YEAR" ]]; then
                LATEST_DAY=$(ls "$LOG_DIR/$LATEST_YEAR" 2>/dev/null | sort | tail -1)
                LATEST_FILE=$(ls "$LOG_DIR/$LATEST_YEAR/$LATEST_DAY" 2>/dev/null | sort | tail -1 2>/dev/null || echo "")
                echo "   Latest: $LOG_DIR/$LATEST_YEAR/$LATEST_DAY/$LATEST_FILE"
            else
                echo "   Directory exists but is empty: $LOG_DIR"
            fi
        else
            echo "   Not found — expected: $LOG_DIR/"
            echo "   New log: $LOG_DIR/$YEAR/$MONTH_DAY/dev.md"
        fi
        echo ""

        # Memory lessons/facts/procedures/fixes
        echo "🧠 MEMORY ARTIFACTS (docs/memories/<type>/YYYY/MM-DD/)"
        for TYPE in lessons facts procedures fixes; do
            MEM_DIR="$REPO_ROOT/$DOCS_ROOT/memories/$TYPE"
            if [[ -d "$MEM_DIR" ]]; then
                COUNT=$(find "$MEM_DIR" -name "*.md" 2>/dev/null | wc -l | tr -d ' ')
                echo "   $TYPE: $COUNT file(s)"
            else
                echo "   $TYPE: not found — new: $MEM_DIR/$YEAR/$MONTH_DAY/"
            fi
        done
        echo ""

        # Audits
        echo "📊 AUDITS (docs/audits/YYYY/MM-DD/)"
        AUDIT_BASE="$REPO_ROOT/$DOCS_ROOT/audits"
        if [[ -d "$AUDIT_BASE" ]]; then
            RECENT=$(find "$AUDIT_BASE" -name "*.md" 2>/dev/null | sort | tail -3)
            if [[ -n "$RECENT" ]]; then
                echo "   Recent:"
                echo "$RECENT" | while read -r f; do
                    echo "     $f"
                done
            else
                echo "   Directory exists but is empty"
            fi
        else
            echo "   Not found — new audit: $AUDIT_BASE/$YEAR/$MONTH_DAY/report-name.md"
        fi
        echo ""

        # Plans and Specs
        echo "📋 PLANS / SPECS"
        echo "   New plan: $REPO_ROOT/$DOCS_ROOT/plans/$YEAR/$MONTH_DAY/plan-name.md"
        echo "   New spec: $REPO_ROOT/$DOCS_ROOT/specs/$YEAR/$MONTH_DAY/spec-name.md"
        echo ""

        # Service docs (if in a service dir)
        if [[ "$PWD" == *"/services/"* ]]; then
            SERVICE_ROOT=$(echo "$PWD" | sed 's|\(.*services/[^/]*\).*|\1|')
            echo "🔧 SERVICE DOCS (detected: $SERVICE_ROOT)"
            for f in README.md ARCHITECTURE.md TESTS.md; do
                if [[ -f "$SERVICE_ROOT/$f" ]]; then
                    echo "   ✓ $SERVICE_ROOT/$f"
                else
                    echo "   ✗ $SERVICE_ROOT/$f (missing)"
                fi
            done
            echo ""
        fi

        print_separator
        echo "Templates: skills/code-documentation/templates/"
        print_separator
        ;;
esac
