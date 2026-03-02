#!/usr/bin/env bash
set -euo pipefail

OUT="${1:-ROLLBACK_PLAN.md}"
cp ".claude/templates/rollback-plan.md" "$OUT"
echo "Wrote $OUT"
