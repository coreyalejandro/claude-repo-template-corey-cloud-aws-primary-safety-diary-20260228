#!/usr/bin/env bash
set -euo pipefail

# Post-edit hook: run formatting on touched files when possible.

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

if command -v node >/dev/null 2>&1 && [ -f "$ROOT/package.json" ]; then
  if command -v npm >/dev/null 2>&1; then
    npm -s --prefix "$ROOT" run format >/dev/null 2>&1 || true
  fi
fi

exit 0
