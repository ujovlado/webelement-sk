#!/bin/bash

docker login -u="$QUAY_USERNAME" -p="$QUAY_PASSWORD" quay.io \
  && docker tag webelement/webelement-web quay.io/webelement/webelement-web:latest \
  && docker images \
  && docker push quay.io/webelement/webelement-web:latest \
  && docker logout \
  && test -z "`curl -X POST https://cloud.docker.com/api/app/v1/service/$DOCKER_CLOUD_SERVICE_ID/trigger/$DOCKER_CLOUD_TRIGGER_ID/call/`"

docker run -i -t --rm \
  -e AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID" \
  -e AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY" \
  quay.io/rekurzia/aws-cli-docker ecr get-login --region eu-central-1 | tr -d "\r\n" | sh \
  && docker tag webelement/webelement-web 297411564328.dkr.ecr.eu-central-1.amazonaws.com/webelement/web:latest \
  && docker push 297411564328.dkr.ecr.eu-central-1.amazonaws.com/webelement/web:latest
