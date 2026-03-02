# CI/CD Runbook

## Workflows

- `CI` runs `./scripts/verify.sh` on PRs and pushes to main.
- `Security` runs secret scanning, dependency scanning, and SAST.
- `SBOM` generates a CycloneDX SBOM artifact.

## Local parity

Run:

- `./scripts/verify.sh`
- `./scripts/security.sh`
- `./scripts/sbom.sh`

## Fail-closed rule

A PR is not mergeable if CI or Security jobs fail.
