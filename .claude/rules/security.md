# Security Rules

- No secrets in repo. Use `.env` (gitignored) and document required keys in `docs/runbooks/secrets.md`.
- Treat `modules/auth`, `modules/billing`, `modules/data` as sensitive:
  - require plan + rollback
  - require focused tests
- Validate user input at boundaries.
