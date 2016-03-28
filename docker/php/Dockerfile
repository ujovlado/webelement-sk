FROM php:5.6
MAINTAINER Vladimír Kriška <ujovlado@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && apt-get install unzip git -y

RUN cd \
  && curl -sS https://getcomposer.org/installer | php \
  && ln -s /root/composer.phar /usr/local/bin/composer
