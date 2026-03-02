# Claude Repo Template (Plain-English Guide)

## What this repo is

This repo is a starter project you can:

- run locally
- test automatically
- package as a Docker image
- deploy to Kubernetes
- wire to cloud infrastructure (AWS first, plus GCP and Azure templates)

If you are wondering "am I supposed to run this or just read it?" — run it.

## What this repo is not

- It is not malware.
- It is not a destructive script pack.
- It does not include real cloud secrets.
- It is not trying to be clever language-wise.

## My role

I (ChatGPT) helped implement and organize this repository from your requirements.
The goal was practical: make a repo that a person can run, verify, and deploy.

## Fast start (3 commands)

From the repo root:

```bash
./scripts/doctor.sh
npm ci
./scripts/verify.sh
```

If all is well, you should see `Verify complete`.

## What you can run next

### Run with Docker

```bash
docker build -t claude-template:local .
docker run -p 3000:3000 claude-template:local
curl http://localhost:3000/healthz
curl http://localhost:3000/readyz
```

### Deploy to Kubernetes (any cluster)

```bash
kubectl apply -f k8s/base/namespace.yaml
kubectl apply -n claude-template -f k8s/base/
kubectl -n claude-template get pods
```

### Provision AWS EKS (primary cloud path)

```bash
cd infra/terraform/aws
terraform init
terraform apply
```

### Deploy to EKS with Helm

```bash
aws eks update-kubeconfig --region "<AWS_REGION>" --name "<EKS_CLUSTER_NAME>"
helm upgrade --install claude-template ./helm/claude-template \
  --namespace claude-template --create-namespace \
  --set image.repository="ghcr.io/<GITHUB_OWNER>/<GITHUB_REPO>" \
  --set image.tag="latest"
kubectl -n claude-template rollout status deploy/claude-template --timeout=180s
```

## Repo map (human version)

- App code: `src/`
- Tests: `tests/`
- Scripts you run: `scripts/`
- Kubernetes files: `k8s/`
- Helm chart: `helm/claude-template/`
- Terraform (AWS/GCP/Azure): `infra/terraform/`
- Cloud identity templates: `infra/identity/`
- Build diary: `docs/appendix/build-diary.md`

## Cloud identity templates

Identity wiring files are in `infra/identity/`:

- AWS OIDC + trust policy templates
- GCP workload identity instructions
- Azure federated credential template

These files use placeholders. You must fill in your own account/project values.

## Acknowledgements

- Thanks to the open tooling ecosystem (Node, Kubernetes, Terraform, GitHub Actions).
- Thanks to Claude Code conventions for folder/workflow inspiration.
- Built with your direction, then implemented and refined with AI assistance.
