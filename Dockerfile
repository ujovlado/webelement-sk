FROM nginx:1.11-alpine

COPY _build /usr/share/nginx/html
COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf
