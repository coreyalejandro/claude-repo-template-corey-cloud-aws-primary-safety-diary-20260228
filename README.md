# Claude Repo OS — AWS-Primary, Safety-First, Future-Proofed

## Introduction

This repository is an **operational system for agent-assisted engineering**: not a prompt, not a vibe, not a “best practices” blog post.  
It is a _production-ready structure_ where correctness is earned through **verification**, **policy enforcement**, **supply-chain integrity**, and **audit trails**.

### My role in creating this repo

I (ChatGPT, GPT-5.2 Thinking) acted as the **implementation partner**: translating the intent (“no mocks, no empty scaffolds—real working repo”) into an executable repository with:

- deterministic verification scripts
- CI gating
- security + SBOM workflows
- containerization
- Kubernetes deployment (manifests + Helm)
- Terraform stacks for AWS/GCP/Azure
- AWS EKS as the **primary** target
- safety-first guardrails (policy-as-code + signing/attestation)

I enforced a fail-closed posture: if something cannot be verified, it is treated as **not shipped**.

---

## What you get

### 1) A real deployable service (not a stub)

- HTTP service with `/healthz` and `/readyz`
- tests verifying endpoints
- TypeScript build output to `dist/`
- production container via `Dockerfile`

### 2) Deterministic verification you can trust

Run:

```bash
./scripts/doctor.sh
npm ci
./scripts/verify.sh
```

Expected: **Verify complete** (build + format + lint + typecheck + tests).

### 3) Security and supply-chain integrity

Run:

```bash
./scripts/security.sh
./scripts/sbom.sh
```

CI also includes:

- secret scanning
- vuln scanning
- SAST
- SBOM generation
- image signing + attestation (see `.github/workflows/provenance.yml`)

### 4) Cloud deployments — AWS is primary

- Kubernetes manifests: `k8s/base/`
- Helm chart: `helm/claude-template/`
- Terraform:
  - AWS EKS: `infra/terraform/aws/` (**primary**)
  - GCP GKE: `infra/terraform/gcp/`
  - Azure AKS: `infra/terraform/azure/`

### 5) Identity wiring in one dedicated place

Cloud identity and credentials templates live here:

- `infra/identity/`

---

## One correct path: Local → Container → Kubernetes → Cloud

### Step 1 — Local proof

```bash
./scripts/doctor.sh
npm ci
./scripts/verify.sh
```

### Step 2 — Container proof

```bash
docker build -t claude-template:local .
docker run -p 3000:3000 claude-template:local
curl http://localhost:3000/healthz
curl http://localhost:3000/readyz
```

### Step 3 — Kubernetes proof (any cluster)

```bash
kubectl apply -f k8s/base/namespace.yaml
kubectl apply -n claude-template -f k8s/base/
kubectl -n claude-template get pods
```

### Step 4 — AWS EKS (primary) provision

```bash
cd infra/terraform/aws
terraform init
terraform apply
```

### Step 5 — AWS EKS deploy via Helm

```bash
aws eks update-kubeconfig --region "<AWS_REGION>" --name "<EKS_CLUSTER_NAME>"
helm upgrade --install claude-template ./helm/claude-template   --namespace claude-template --create-namespace   --set image.repository="ghcr.io/<GITHUB_OWNER>/<GITHUB_REPO>"   --set image.tag="latest"
kubectl -n claude-template rollout status deploy/claude-template --timeout=180s
```

---

## Where the “hard rules” live

- Repo north star: `CLAUDE.md`
- Scoped constraints: `.claude/rules/`
- Repeatable workflows: `.claude/skills/`
- Deterministic enforcement: `.claude/hooks/` + `scripts/`
- Sensitive module guardrails: `modules/*/CLAUDE.md`
- Auditability: `docs/runbooks/auditability.md`
- Safety-first controls: `docs/runbooks/ai-safety-first.md`
- Identity wiring: `infra/identity/`

---

## Appendix

- Build diary (metacognitive notes): `docs/appendix/build-diary.md`

---

## Acknowledgements

- Original pattern inspiration: the broader “repo-as-memory” approach popularized by Claude Code practitioners.
- Claude Code documentation and conventions helped inform folder semantics and workflow expectations.
- Built and assembled by **ChatGPT (GPT-5.2 Thinking)** as an implementation partner responding to a user-defined deterministic build intent.
