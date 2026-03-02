#!/usr/bin/env bash
set -euo pipefail

OUT="${1:-CHANGE_PLAN.md}"
cp ".claude/templates/change-plan.md" "$OUT"
echo "Wrote $OUT"
