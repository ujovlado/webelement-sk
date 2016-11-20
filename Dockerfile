FROM nginx:1.11-alpine
MAINTAINER Vladimír Kriška <ujovlado@gmail.com>

COPY _build /etc/nginx/html
COPY docker/nginx/webelement.conf /etc/nginx/nginx.conf
