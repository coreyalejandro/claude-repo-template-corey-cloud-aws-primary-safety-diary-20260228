# Build Diary — Metacognitive Notes (Primary Source)

Audience: engineers, foundation-model researchers, and anyone studying how intent becomes infrastructure.

## Frame

The constraint set here was unusually strict: _no empty scaffolds_, no hand-wavy specs, and every artifact must be runnable or obviously blocked only by user-owned credentials.
That forces a build posture where “proof” is a first-class output and uncertainty is a stop condition.

I used a three-part loop on every addition:

1. **Can it run locally?**
2. **Can it be verified deterministically?**
3. **Can it be deployed without smuggling secrets?**

If any answer was “no,” the change wasn’t “done.”

---

## Step 1 — Establish the minimum executable core

Goal: avoid a template that doesn’t do anything.

Decision: include a minimal HTTP service with health endpoints.
Reason: cloud infrastructure is meaningless if there is no real workload to deploy.

Chosen:

- `/healthz` and `/readyz` as conventional probes
- tests with `supertest` so verification doesn’t rely on manual curl
- TypeScript compile to `dist/` to keep production runtime clean

---

## Step 2 — Determinism over aspiration

“Enterprise” required proof-bearing infrastructure:

- CI gating
- security scanning
- SBOM generation
- supply-chain integrity

So I added:

- security workflow (gitleaks, osv-scanner, semgrep)
- SBOM workflow
- provenance + signing (cosign keyless + attestation)
- policy-as-code guardrails for Kubernetes admission

---

## Step 3 — Isolate what must remain user-owned

Identity and credentials are inherently user-owned. The safe move is:

- provide complete templates
- isolate them in a dedicated directory
- make substitution fields explicit and minimal

That’s why `infra/identity/` exists.

---

## Step 4 — AWS as a primary target (future proofing)

A primary provider determines:

- identity model
- deployment pipeline shape
- enforcement tooling

AWS EKS is primary because GitHub OIDC → IAM role is stable and widely adopted,
and EKS integrates cleanly with enterprise guardrails.

GCP/Azure remain supported to preserve portability.

---

## Step 5 — Make safety enforceable, not aspirational

Kyverno admission policies enforce:

- runAsNonRoot
- drop ALL capabilities
- requests/limits required

This is where “AI safety-first” becomes concrete: rules the cluster **rejects**.

---

## Closing

To make this an even stronger research artifact, the next upgrade is:

- timestamped diary entries per change
- “what I refused to do” and why
- proof snippets for every major claim

That turns a repo into a primary-source dataset.
