# Cloud Infrastructure

Terraform stacks:

- `infra/terraform/aws` — EKS (AWS)
- `infra/terraform/gcp` — GKE (GCP)
- `infra/terraform/azure` — AKS (Azure)

Kubernetes:

- `k8s/base` — raw manifests
- `helm/claude-template` — Helm chart

CI deploy:

- `.github/workflows/container.yml` builds/pushes to GHCR
- `.github/workflows/deploy-k8s.yml` applies manifests to your cluster (kubeconfig secret)
