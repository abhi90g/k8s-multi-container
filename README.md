# k8s-multi-container

This shows: 
- 4 separate docker images
  - docker-multi-client
  - docker-multi-nginx
  - docker-multi-server
  - docker-multi-worker 
- all images pushed to docker hub
- docker-multi-client: simple React Fib calculator UI
- docker-multi-server: nodejs server with postgres and redis setup
- docker-multi-worker: worker image for redis
- docker-multi-nginx: client and server routing
- Google cloud deployment
- travis for:
  - CI/CD with react test
  - automatic push of images to docker hub
  - after image push, deploy to google cloud through deploy.sh script
  
  
#### On Google cloud  
- run following cmds one time for initial setup in google cloud shell (for each new cluster)
  - gcloud config set project `<project ID>`
  - gcloud config set compute/zone `<location of kubernetes cluster>`
  - gcloud container clusters get-credentials `<project name>

#### Create secret for cluster on gcloud for postgres
- kubectl create secret generic pgpassword --from-literal <KEY>=<password>

#### Installation: helm 3 and ingress-nginx
- run following once for new cluster
  - curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
  - chmod 700 get_helm.sh
  - ./get_helm.sh
- for ingress-nginx install
  - helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
  - helm install my-release ingress-nginx/ingress-nginx