# Architecture Overview

This repo is organized as **persistent context**, not a single prompt.

## Core principle

Rules that must be true are enforced via:

- structure (`docs/`, `checklists/`, `modules/*/CLAUDE.md`)
- automation (`scripts/`, `.claude/hooks/`)
- scoped knowledge (`.claude/rules/`, `.claude/skills/`, `.claude/subagents/`)

## Diagram (Mermaid)

See `docs/architecture/overview.mmd`.
