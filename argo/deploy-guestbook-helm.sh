argocd app create guestbook \
--port-forward-namespace argocd \
--repo https://github.com/argoproj/argocd-example-apps.git \
--path helm-guestbook \
--dest-server https://kubernetes.default.svc \
--dest-namespace default
