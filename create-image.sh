#!/bin/bash

docker build -t webelement/web .
docker ps -a

docker login -e="." -u="$QUAY_USERNAME" -p="$QUAY_PASSWORD" quay.io
docker tag webelement/web quay.io/webelement/web:latest
docker push quay.io/webelement/web:latest
