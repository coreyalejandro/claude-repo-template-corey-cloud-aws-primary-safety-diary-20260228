# Azure Federated Credentials (GitHub Actions)

Placeholders to replace:

- `<AZURE_CLIENT_ID>`
- `<GITHUB_OWNER>`
- `<GITHUB_REPO>`

## Create federated credential

Edit `infra/identity/azure/federated-credential.json` with your values, then:

```bash
az ad app federated-credential create   --id "<AZURE_CLIENT_ID>"   --parameters infra/identity/azure/federated-credential.json
```
