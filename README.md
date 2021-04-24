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
- run following cmds one time for initial setup in google cloud shell
  - gcloud config set project `<project ID>`
  - gcloud config set compute/zone `<location of kubernetes cluster>`
  - gcloud container clusters get-credentials `<project name>
