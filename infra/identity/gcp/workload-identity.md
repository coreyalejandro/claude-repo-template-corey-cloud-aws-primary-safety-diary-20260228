# GCP Workload Identity Federation (GitHub Actions)

This is the **identity wiring** needed for GitHub Actions → GCP without long-lived keys.

Placeholders you must replace:

- `<GCP_PROJECT_ID>`
- `<PROJECT_NUMBER>`
- `<GITHUB_OWNER>`
- `<GITHUB_REPO>`
- `<POOL_ID>`
- `<PROVIDER_ID>`
- `<SERVICE_ACCOUNT_NAME>`

## Create pool

```bash
gcloud iam workload-identity-pools create "<POOL_ID>"   --project="<GCP_PROJECT_ID>"   --location="global"   --display-name="GitHub Actions Pool"
```

## Create provider

```bash
gcloud iam workload-identity-pools providers create-oidc "<PROVIDER_ID>"   --project="<GCP_PROJECT_ID>"   --location="global"   --workload-identity-pool="<POOL_ID>"   --display-name="GitHub OIDC Provider"   --issuer-uri="https://token.actions.githubusercontent.com"   --attribute-mapping="google.subject=assertion.sub,attribute.repository=assertion.repository"   --attribute-condition="attribute.repository == '<GITHUB_OWNER>/<GITHUB_REPO>'"
```

## Create service account

```bash
gcloud iam service-accounts create "<SERVICE_ACCOUNT_NAME>" --project="<GCP_PROJECT_ID>"
```

## Bind principal to service account

```bash
gcloud iam service-accounts add-iam-policy-binding   "<SERVICE_ACCOUNT_NAME>@<GCP_PROJECT_ID>.iam.gserviceaccount.com"   --project="<GCP_PROJECT_ID>"   --role="roles/iam.workloadIdentityUser"   --member="principalSet://iam.googleapis.com/projects/<PROJECT_NUMBER>/locations/global/workloadIdentityPools/<POOL_ID>/attribute.repository/<GITHUB_OWNER>/<GITHUB_REPO>"
```
