docker build -t svarpe/multi-client:latest -t svarpe/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t svarpe/multi-server:latest -t svarpe/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t svarpe/multi-worker:latest -t svarpe/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push svarpe/multi-client:latest
docker push svarpe/multi-server:latest
docker push svarpe/multi-worker:latest

docker push svarpe/multi-client:$SHA
docker push svarpe/multi-server:$SHA
docker push svarpe/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=svarpe/multi-server:$SHA
kubectl set image deployments/client-deployment client=svarpe/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=svarpe/multi-worker:$SHA