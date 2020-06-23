ENV=$1
SYNC_POLICY=$2

argocd app create guestbook-$ENV \
    --label environment=$ENV \
    --dest-namespace $ENV \
    --revision $ENV \
    --upsert \
    --sync-policy $SYNC_POLICY \
    --port-forward-namespace argocd \
    --repo https://github.com/parkergordonio/argocd-example-apps.git \
    --path helm-guestbook \
    --dest-server https://kubernetes.default.svc;
