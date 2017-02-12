#!/bin/bash

docker login -u="$QUAY_USERNAME" -p="$QUAY_PASSWORD" quay.io \
  && docker tag webelement/webelement-web quay.io/webelement/webelement-web:latest \
  && docker images \
  && docker push quay.io/webelement/webelement-web:latest \
  && test -z "`curl -X POST https://cloud.docker.com/api/app/v1/service/$DOCKER_CLOUD_SERVICE_ID/trigger/$DOCKER_CLOUD_TRIGGER_ID/call/`"
