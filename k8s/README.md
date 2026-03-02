# Kubernetes Deployment

Apply:

```bash
kubectl apply -f k8s/base/namespace.yaml
kubectl apply -n claude-template -f k8s/base/
```

Update image:

- edit `k8s/base/deployment.yaml` (`spec.template.spec.containers[0].image`)
- re-apply

Ingress:

- assumes nginx ingress controller
