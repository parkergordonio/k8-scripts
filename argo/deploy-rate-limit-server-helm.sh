argocd app create rate-limit-server \
  --repo git@github.com:Omnistac/unity.git \
  --path k8s/demo/rate-limit-server \
  --dest-server https://kubernetes.default.svc \
  --dest-namespace race-demo
