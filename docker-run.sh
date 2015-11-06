#!/bin/bash

if [[ ! `docker ps --all | grep "webelement-data"` ]]; then
  docker run --name webelement-data webelement/data
fi

docker run --volumes-from webelement-data -i -t --rm -v "$PWD:/data" -w /data -p 4000:4000 webelement/website:latest sh -c 'bower install --allow-root && npm install && gulp clean && gulp'