#!/bin/bash

echo "======================================="
echo "Building docket images!"
echo "======================================="

docker build -t $DOCKER_USERNAME/multi-client-k8s:latest -t $DOCKER_USERNAME/multi-client-k8s:$GITHUB_SHA -f ./client/Dockerfile ./client
docker build -t $DOCKER_USERNAME/multi-server-k8s-pgfix:latest -t $DOCKER_USERNAME/multi-server-k8s-pgfix:$GITHUB_SHA -f ./server/Dockerfile ./server
docker build -t $DOCKER_USERNAME/multi-worker-k8s:latest -t $DOCKER_USERNAME/multi-worker-k8s:$GITHUB_SHA -f ./worker/Dockerfile ./worker

echo "======================================="
echo "Pushing docket images to Docker hub!"
echo "======================================="

docker push $DOCKER_USERNAME/multi-client-k8s:latest
docker push $DOCKER_USERNAME/multi-server-k8s-pgfix:latest
docker push $DOCKER_USERNAME/multi-worker-k8s:latest

docker push $DOCKER_USERNAME/multi-client-k8s:$GITHUB_SHA
docker push $DOCKER_USERNAME/multi-server-k8s-pgfix:$GITHUB_SHA
docker push $DOCKER_USERNAME/multi-worker-k8s:$GITHUB_SHA
