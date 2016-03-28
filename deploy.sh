#!/bin/bash

docker build -t webelement/web .
docker ps -a

docker login -e="." -u="$QUAY_USERNAME" -p="$QUAY_PASSWORD" quay.io
docker tag webelement/web quay.io/webelement/web:latest
docker push quay.io/webelement/web:latest

echo "Redeploying service ..."
curl -X POST -s https://cloud.docker.com/api/app/v1/service/$DOCKER_CLOUD_SERVICE_ID/trigger/$DOCKER_CLOUD_TRIGGER_ID/call/ -o /dev/null
