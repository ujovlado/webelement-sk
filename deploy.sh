#!/bin/bash

docker login -u="$QUAY_USERNAME" -p="$QUAY_PASSWORD" quay.io \
  && docker tag webelement/web quay.io/webelement/web:latest \
  && docker images \
  && docker push quay.io/webelement/web:latest \
