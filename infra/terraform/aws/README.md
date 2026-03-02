# AWS EKS (Terraform) — Primary Target

This stack provisions:

- VPC (public/private subnets + NAT)
- EKS cluster + managed node group

## Safety-first defaults

- Private subnets for nodes
- Minimal public exposure (use Ingress controller + security groups)
- Use policy-as-code via `k8s/policies/`

## Prereqs

- terraform >= 1.6
- AWS credentials configured locally, or GitHub OIDC for CI

## Local apply

```bash
cd infra/terraform/aws
terraform init
terraform apply
```

## Configure kubeconfig

```bash
aws eks update-kubeconfig --region us-east-1 --name claude-template
kubectl get nodes
```

## GitHub Actions (recommended)

Workflows:

- `.github/workflows/aws-eks-terraform.yml`
- `.github/workflows/aws-eks-deploy-helm.yml`

Secrets required:

- `AWS_ROLE_TO_ASSUME` (IAM role with OIDC trust to GitHub)
- `AWS_REGION` (e.g., us-east-1)
- `EKS_CLUSTER_NAME` (e.g., claude-template)
