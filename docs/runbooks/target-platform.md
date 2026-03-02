# Target Platform (Primary)

**Primary target:** AWS EKS (Kubernetes on AWS)

Rationale (future-proofing + safety-first):

- Mature IAM + OIDC integration for GitHub Actions and workload identity.
- Strong ecosystem for policy enforcement, signing, provenance, and supply-chain controls.
- Clear separation between control plane, node groups, and IRSA for least-privilege.

Secondary compatibility:

- GCP GKE and Azure AKS are included as alternate stacks in `infra/terraform/*`.
