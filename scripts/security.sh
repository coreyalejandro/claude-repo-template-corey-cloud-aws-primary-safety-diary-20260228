#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

echo "== Security =="

# Secret scan (local)
if command -v gitleaks >/dev/null 2>&1; then
  gitleaks detect --source . --no-git -v
  echo "✅ gitleaks"
else
  echo "⚠️  gitleaks not installed (recommended)."
fi

# Dependency vuln scan (local)
if command -v osv-scanner >/dev/null 2>&1; then
  osv-scanner -r .
  echo "✅ osv-scanner"
else
  echo "⚠️  osv-scanner not installed (recommended)."
fi

# SAST (local)
if command -v semgrep >/dev/null 2>&1; then
  semgrep --config p/default .
  echo "✅ semgrep"
else
  echo "⚠️  semgrep not installed (recommended)."
fi

echo "Security complete."
