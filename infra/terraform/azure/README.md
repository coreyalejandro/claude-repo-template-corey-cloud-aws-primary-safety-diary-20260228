# Azure AKS (Terraform)

Prereqs:

- terraform >= 1.6
- az login

Run:

```bash
cd infra/terraform/azure
terraform init
terraform apply
```

Kubeconfig:

```bash
az aks get-credentials --resource-group rg-claude-template --name aks-claude-template
kubectl get nodes
```
