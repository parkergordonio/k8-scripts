kapi() {
    kubectl api-resources | sk --header-lines=1 | awk '{print $1}'
}
kns() {
    kubectl get ns | sk --header-lines=1 | awk '{print $1}'
}
ks() {
    if [ -z $1 ]
    then
        export KSRC=$(kapi)
    else
        export KSRC=$1
    fi
    if [ -z $2 ]
    then
        local line=$(kubectl get $KSRC --all-namespaces --sort-by '{metadata.creationTimestamp}' | awk 'NR == 1; NR > 1 {print $0 | "tac"}' | sk --header-lines=1 --preview "kubectl describe $KSRC -n {1} {2} | tail -n 65")
        export KNS=$(echo $line | awk '{print $1}')
        export KOBJ=$(echo $line | awk '{print $2}')
    else
        export KNS=$2
        export KOBJ=$(kubectl get $KSRC -n $KNS | sk --header-lines=1 | awk '{print $2}')
    fi
}
kl() {
    local params=""
    if [ "$1" = "-f" ]
    then
      local params="-f"
      shift 1
    fi
    ks pods $1
    local kpod=$(kubectl get pods -n $KNS $KOBJ -o jsonpath='{.spec.containers[*].name}' | tr " " "\n")
    if [ $(echo $kpod | wc -l) -ne 1 ]
    then
      kpod=$(echo $kpod | sk)
    fi
    # rargs?
    kubectl logs -n $KNS $KOBJ $kpod $params
}
kd() {
    ks $@
    kubectl describe $KSRC -n $KNS $KOBJ
}
