#!/bin/bash

docker-compose run --rm node \
  && cp -R fontello/build/font/ app/ \
  && cp -R bower_components/bootstrap-sass/assets/stylesheets/ app/_sass \
  && cp fontello/build/css/fontello.css app/css/ \
  && docker-compose run --rm --service-ports jekyll jekyll serve -s ./app --watch -H 0.0.0.0
