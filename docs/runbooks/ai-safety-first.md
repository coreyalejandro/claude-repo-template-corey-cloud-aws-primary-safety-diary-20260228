# AI Safety-First Engineering Controls

This repo is designed to reduce the risk of **overconfident, unaudited changes**.

Controls:

- Plan-first workflow (`.claude/skills/plan-first.md`)
- Fail-closed verification (`scripts/verify.sh`, CI gating)
- Supply-chain integrity:
  - SBOM generation (`scripts/sbom.sh`)
  - Vulnerability scanning (`scripts/security.sh`, CI security workflow)
  - Image signing + attestations (`.github/workflows/provenance.yml`)
- Kubernetes admission guardrails (policy-as-code):
  - enforce non-root execution
  - enforce dropped capabilities
  - enforce resource limits

Operational principle:

- If something cannot be verified, it is not shipped.
