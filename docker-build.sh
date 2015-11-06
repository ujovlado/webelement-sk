#!/bin/bash

docker build -t webelement/data -f ./.docker/data .
docker build -t webelement/website --build-arg userId=`id -u` --build-arg groupId=`id -g` -f ./.docker/website .
