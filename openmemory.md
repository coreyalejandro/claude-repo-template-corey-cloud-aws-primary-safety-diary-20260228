# OpenMemory Guide

## Overview

- Project: `coreyalejandro/COL-REASONS-ASF-2026`
- Purpose: deterministic, safety-first repo operating system for agent-assisted engineering
- Primary stack: Node.js + TypeScript service with verification scripts, CI workflows, Kubernetes/Helm, and multi-cloud infra templates

## Architecture

- App runtime: `src/` with HTTP service and probe endpoints
- Verification and automation: `scripts/` plus workflow gates in `.github/workflows/`
- Deployment artifacts: `k8s/base/` and `helm/claude-template/`
- Cloud infrastructure: `infra/terraform/aws|gcp|azure/`
- Identity wiring templates: `infra/identity/` for AWS/GCP/Azure federation setup

## Key Components

- `scripts/doctor.sh`: local toolchain readiness checks
- `scripts/verify.sh`: deterministic format/lint/typecheck/test verification path
- `eslint.config.js`: JavaScript lint configuration used in verification
- `.prettierignore`: formatting exclusions for templated YAML that Prettier cannot parse directly

## Patterns

- Fail-closed verification: verification scripts should return non-zero on any failed step
- Templated infra safety: Helm template YAML files are excluded from raw Prettier parsing
- Runnable-first workflow: local checks (`doctor`, install, `verify`) gate further deployment steps

## User Defined Namespaces

- [Leave blank - user populates]
