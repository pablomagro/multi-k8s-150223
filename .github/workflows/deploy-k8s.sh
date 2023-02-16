#!/bin/bash

echo "======================================="
echo "Apply kubectl deployments!"
echo "======================================="

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=$DOCKER_USERNAME/multi-server-k8s-pgfix:$GITHUB_SHA
kubectl set image deployments/client-deployment client=$DOCKER_USERNAME/multi-client-k8s:$GITHUB_SHA
kubectl set image deployments/worker-deployment worker=$DOCKER_USERNAME/multi-worker-k8s:$GITHUB_SHA

kubectl get services -o wide
