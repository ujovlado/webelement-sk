#!/bin/bash

if [[ ! `docker ps --all | grep "webelement-data"` ]]; then
  docker run --name webelement-data webelement/data:latest chown -R `id -u`:`id -g` /data/node_modules /data/bower_components
fi

docker run -u `id -u` --volumes-from webelement-data --rm -v "$PWD:/data" -w /data webelement/website:latest sh -c 'bower install --allow-root && npm install && gulp clean && gulp sprite && JEKYLL_ENV=production gulp jekyll && gulp css && gulp fonts && gulp minify && gulp revreplace'