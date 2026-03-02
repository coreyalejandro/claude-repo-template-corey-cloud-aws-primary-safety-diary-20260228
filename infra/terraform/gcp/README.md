# GCP GKE (Terraform)

Prereqs:

- terraform >= 1.6
- gcloud authenticated
- billing enabled

Run:

```bash
cd infra/terraform/gcp
terraform init
terraform apply -var="project_id=YOUR_PROJECT_ID"
```

Kubeconfig:

```bash
gcloud container clusters get-credentials claude-template --region us-central1 --project YOUR_PROJECT_ID
kubectl get nodes
```
