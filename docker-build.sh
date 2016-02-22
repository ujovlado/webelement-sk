#!/bin/bash

docker build -t webelement/bower-and-node ./docker/bower-and-node \
&& docker build \
  -t webelement/website \
  --build-arg userId=`id -u` \
  --build-arg groupId=`id -g` \
  ./docker/website
