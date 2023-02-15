docker build -t pmagas/multi-client-k8s:latest -t pmagas/multi-client-k8s:$GITHUB_SHA -f ./client/Dockerfile ./client
docker build -t pmagas/multi-server-k8s-pgfix:latest -t pmagas/multi-server-k8s-pgfix:$GITHUB_SHA -f ./server/Dockerfile ./server
docker build -t pmagas/multi-worker-k8s:latest -t pmagas/multi-worker-k8s:$GITHUB_SHA -f ./worker/Dockerfile ./worker

docker push pmagas/multi-client-k8s:latest
docker push pmagas/multi-server-k8s-pgfix:latest
docker push pmagas/multi-worker-k8s:latest

docker push pmagas/multi-client-k8s:$GITHUB_SHA
docker push pmagas/multi-server-k8s-pgfix:$GITHUB_SHA
docker push pmagas/multi-worker-k8s:$GITHUB_SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=pmagas/multi-server-k8s-pgfix:$GITHUB_SHA
kubectl set image deployments/client-deployment client=pmagas/multi-client-k8s:$GITHUB_SHA
kubectl set image deployments/worker-deployment worker=pmagas/multi-worker-k8s:$GITHUB_SHA
