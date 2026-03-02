# Auditability Runbook

Every meaningful change must leave an auditable trail:

- **Plan**: `CHANGE_PLAN.md` (or PR description with equivalent fields)
- **Proof**: test output, typecheck, lint, or deterministic repro
- **Risk**: LOW/MED/HIGH
- **Rollback**: required for MED/HIGH
- **Docs**: update tutorials/runbooks for user-facing changes

Where to store proof:

- CI logs (preferred)
- local logs captured in PR
- screenshots in `screenshots/` when relevant
