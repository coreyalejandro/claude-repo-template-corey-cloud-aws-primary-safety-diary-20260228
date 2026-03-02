# Secrets Runbook

Rules:

- Never commit secrets.
- Use `.env` (gitignored) for local dev.
- Document required variables here without values.

Example:

- `OPENAI_API_KEY` — required for AI calls (local only)
