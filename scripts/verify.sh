#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

echo "== Verify =="

# Prefer pnpm if lockfile exists
run_node() {
  if [ -f "pnpm-lock.yaml" ] && command -v pnpm >/dev/null 2>&1; then
    pnpm -s install || return 1
    pnpm -s run build || return 1
    npm -s run format || return 1
    pnpm -s run lint || return 1
    pnpm -s run typecheck || return 1
    pnpm -s run test || return 1
    return 0
  fi

  if command -v npm >/dev/null 2>&1 && [ -f "package.json" ]; then
    npm -s install || return 1
    npm -s run build || return 1
    npm -s run format || return 1
    npm -s run lint || return 1
    npm -s run typecheck || return 1
    npm -s run test || return 1
    return 0
  fi

  return 1
}

run_python() {
  if command -v python3 >/dev/null 2>&1; then
    # If a python project exists, run a minimal sanity check
    if [ -f "pyproject.toml" ] || [ -f "requirements.txt" ]; then
      python3 -m compileall . >/dev/null
      echo "✅ python compileall"
      return 0
    fi
  fi
  return 1
}

if run_node; then
  echo "✅ node toolchain verification complete"
elif run_python; then
  echo "✅ python toolchain verification complete"
else
  echo "❌ No verifiable toolchain detected."
  echo "Install Node (recommended) or add python project files, then rerun."
  exit 1
fi

echo "Verify complete."
