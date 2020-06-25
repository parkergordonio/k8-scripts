### Helm Chart
Source: https://hub.helm.sh/charts/carlosjgp/zipkin

### Setup
Once you run the `add-helm-repo.sh` and `install-helm-chart.sh` scripts, do:

#### Manual run
You can use the scripts in this repo to setup the service, and run the UI, but here are the manual steps to run the UI

1. Get the application URL by running these commands:
  export POD_NAME=$(kubectl get pods --namespace zipkin -l "app.kubernetes.io/name=zipkin,app.kubernetes.io/instance=zipkin,app.kubernetes.io/component=ui" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl --namespace zipkin port-forward $POD_NAME 8080:8080
  export POD_NAME=$(kubectl get pods --namespace zipkin -l "app.kubernetes.io/name=zipkin,app.kubernetes.io/instance=zipkin,app.kubernetes.io/component=collector" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl --namespace zipkin port-forward $POD_NAME 8080:9411