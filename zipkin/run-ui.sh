export POD_NAME=$(kubectl get pods --namespace zipkin -l "app.kubernetes.io/name=zipkin,app.kubernetes.io/instance=zipkin,app.kubernetes.io/component=ui" -o jsonpath="{.items[0].metadata.name}")
echo "Visit http://127.0.0.1:8080 to use your application"
kubectl --namespace zipkin port-forward $POD_NAME 8080:8080