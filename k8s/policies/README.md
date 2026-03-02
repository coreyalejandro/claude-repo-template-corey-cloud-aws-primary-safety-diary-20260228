# Cluster Policies (Safety-first)

This folder contains **policy-as-code** to enforce guardrails at admission time.

Primary engine: Kyverno.

Policies included:

- require runAsNonRoot
- drop ALL capabilities
- require cpu/memory requests+limits

Apply (cluster-admin required):

```bash
kubectl apply -f k8s/policies/kyverno/
```
