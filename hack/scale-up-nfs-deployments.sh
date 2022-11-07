#!/bin/bash

nfs_deployments=$(kubectl get deploy --all-namespaces -ojsonpath='{range .items[?(@.spec.template.spec.volumes[*].nfs)]}{.metadata.namespace}{" "}{.metadata.name}{"\n"}' | head -n -1)
declare -a arr=($nfs_deployments)
len=${#arr[*]}

for (( i=0; i<$len; i++ )); do \
  f=$i+1; \
  kubectl -n ${arr[$i]} scale --replicas=1 deployment ${arr[$f]}; \
  i=$f; \
done

kubectl -n development scale --replicas=1 sts --all