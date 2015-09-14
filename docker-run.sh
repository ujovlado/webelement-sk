#!/bin/bash

docker run -i -t --rm -v "$PWD:/jekyll" -w /jekyll -p 4000:4000 webelement/website:latest sh -c 'composer install && npm install && gulp clean && gulp'
