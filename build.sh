#!/bin/bash

docker-compose run --rm node \
  && cp -R fontello/build/font/ app/ \
  && cp -R bower_components/bootstrap-sass/assets/stylesheets/ app/_sass \
  && cp fontello/build/css/fontello.css app/css/ \
  && docker-compose run --rm jekyll jekyll build -s ./app -d _build
