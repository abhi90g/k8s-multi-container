docker build -t abhi90g/docker-multi-client:latest -t abhi90g/docker-multi-client:$SHA -f ./client/Dockerfile ./client #creates 2 images (with latest version and another with git-SHA)
docker build -t abhi90g/docker-multi-server:latest -t abhi90g/docker-multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t abhi90g/docker-multi-worker:latest -t abhi90g/docker-multi-worker:$SHA -f ./worker/Dockerfile ./worker
# docker push of latest images
docker push abhi90g/docker-multi-client:latest
docker push abhi90g/docker-multi-server:latest 
docker push abhi90g/docker-multi-worker:latest 
# additional docker push with git SHA as version
docker push abhi90g/docker-multi-client:$SHA
docker push abhi90g/docker-multi-server:$SHA 
docker push abhi90g/docker-multi-worker:$SHA 

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=abhi90g/docker-multi-server:$SHA
kubectl set image deployments/client-deployment client=abhi90g/docker-multi-client:$SHA
kubectl set image deployments/worker-deployment worker=abhi90g/docker-multi-worker:$SHA