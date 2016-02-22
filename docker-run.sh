#!/bin/bash

if [[ ! `docker ps --all | grep "webelement-bower-and-node"` ]]; then
  docker run \
    --name webelement-data \
    webelement/data:latest \
    chown -R `id -u`:`id -g` /data/node_modules /data/bower_components
fi

docker run \
  -u `id -u` \
  --volumes-from webelement-data \
  -i \
  -t \
  --rm \
  -v "$PWD:/data" \
  -w /data \
  -p 4000:4000 webelement/website:latest \
  sh -c 'bower install && npm install && gulp clean && gulp'
