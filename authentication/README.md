# kube authentication resources

Add oidc setup to kops cluster:

```
spec:
  kubeAPIServer:
    oidcIssuerURL: https://dev-8cwc4puz.us.auth0.com/
    oidcClientID: gQQ39y8Ho7ZCcrmRPcO6zvpG8SLhwGDc
    oidcUsernameClaim: sub
```

Create UI:

```
kubectl create -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/kubernetes-dashboard/v1.6.3.yaml
```

