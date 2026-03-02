#!/usr/bin/env bash
set -euo pipefail

echo "== Toolchain Doctor =="

ok=0

if command -v node >/dev/null 2>&1; then
  echo "✅ node: $(node -v)"
  ok=1
else
  echo "❌ node: not found"
fi

if command -v npm >/dev/null 2>&1; then
  echo "✅ npm: $(npm -v)"
else
  echo "⚠️  npm: not found (node projects may not verify)"
fi

if command -v pnpm >/dev/null 2>&1; then
  echo "✅ pnpm: $(pnpm -v)"
else
  echo "ℹ️  pnpm: not found"
fi

if command -v python3 >/dev/null 2>&1; then
  echo "✅ python3: $(python3 --version)"
  ok=1
else
  echo "❌ python3: not found"
fi

if [ "$ok" -eq 0 ]; then
  echo ""
  echo "No supported toolchain found. Install Node or Python and re-run."
  exit 1
fi

echo "Doctor complete."


echo ""
echo "== Recommended security tools ==" 
for t in gitleaks osv-scanner semgrep; do
  if command -v "$t" >/dev/null 2>&1; then
    echo "✅ $t"
  else
    echo "ℹ️  $t not found"
  fi
done
