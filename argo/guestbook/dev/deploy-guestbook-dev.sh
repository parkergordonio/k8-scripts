ENV="dev"
SYNC_POLICY="automated"

kubectl create ns $ENV;
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";

$DIR/../deploy-guestbook.sh $ENV $SYNC_POLICY;
