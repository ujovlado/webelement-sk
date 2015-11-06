#!/bin/bash

docker build -t webelement/data -f ./.docker/data .
docker build -t webelement/website -f ./.docker/website .
