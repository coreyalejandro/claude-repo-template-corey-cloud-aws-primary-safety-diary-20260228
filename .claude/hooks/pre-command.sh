#!/usr/bin/env bash
set -euo pipefail

# Pre-command hook: sanity checks for risky directories.
# This is a template; wire it into your Claude Code hook system if available.

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# If the working tree includes changes under sensitive modules, require plan files.
if git -C "$ROOT" diff --name-only --cached 2>/dev/null | grep -E '^modules/(auth|billing|data)/' >/dev/null; then
  if [ ! -f "$ROOT/.claude/templates/change-plan.md" ]; then
    echo "BLOCK: missing change plan template (unexpected)."
    exit 1
  fi
fi

exit 0
