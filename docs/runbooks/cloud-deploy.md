# Cloud Deployment Runbook

This repository supports **Kubernetes** on:

- AWS EKS (`infra/terraform/aws`)
- GCP GKE (`infra/terraform/gcp`)
- Azure AKS (`infra/terraform/azure`)

## Build container

Local:

```bash
docker build -t claude-template:local .
docker run -p 3000:3000 claude-template:local
curl http://localhost:3000/healthz
```

GitHub:

- Run workflow: `.github/workflows/container.yml`
- Image is pushed to GHCR as `ghcr.io/<owner>/<repo>:<tag>`

## Deploy to Kubernetes

Option A: raw manifests

```bash
kubectl apply -f k8s/base/namespace.yaml
kubectl apply -n claude-template -f k8s/base/
```

Option B: Helm

```bash
helm install claude-template ./helm/claude-template
```

## GitHub deploy workflow

- Create a secret `KUBECONFIG_B64` (base64-encoded kubeconfig)
- Run `.github/workflows/deploy-k8s.yml` and pass the image tag
