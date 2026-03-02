# Definition of Done

A change is DONE only if all are true:

| Item         | Requirement                                | Proof                              |
| ------------ | ------------------------------------------ | ---------------------------------- |
| Scope        | One atomic intent                          | PR/commit summary                  |
| Plan         | Explore → Plan → Execute → Verify recorded | `CHANGE_PLAN.md` or PR description |
| Verification | strongest available suite ran              | `./scripts/verify.sh` output       |
| Tests        | new behavior has tests                     | test files + pass                  |
| Risk         | risk assessed (LOW/MED/HIGH)               | checklist section                  |
| Rollback     | for MED/HIGH, rollback documented          | `ROLLBACK_PLAN.md`                 |
| Docs         | tutorials updated if user-facing           | docs diff                          |

| Security | security checks ran (or reason) | `./scripts/security.sh` output |
| SBOM | SBOM generated for releases | `./scripts/sbom.sh` output |
