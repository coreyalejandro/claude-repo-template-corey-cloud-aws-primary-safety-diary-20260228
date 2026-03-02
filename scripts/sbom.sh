#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

mkdir -p artifacts/sbom

echo "== SBOM =="

# CycloneDX for Node
if command -v npx >/dev/null 2>&1; then
  npx -y @cyclonedx/cyclonedx-npm --output-file artifacts/sbom/bom.json
  echo "✅ SBOM generated at artifacts/sbom/bom.json"
else
  echo "❌ npx not available; install Node/npm."
  exit 1
fi
