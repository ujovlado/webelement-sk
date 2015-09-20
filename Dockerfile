FROM ubuntu:15.04
MAINTAINER ujovlado@gmail.com

# upgrade the system
RUN apt-get update
RUN apt-get upgrade -y

# ruby and other dependencies, then required gems
RUN apt-get install ruby ruby-dev make nodejs ca-certificates gcc -y
RUN gem install jekyll jekyll-sitemap jekyll-redirect-from

RUN mkdir -p /jekyll

# install php and composer
RUN apt-get install curl php5-cli -y
RUN cd && curl -sS https://getcomposer.org/installer | php && ln -s /root/composer.phar /usr/local/bin/composer

# node/gulp related
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install nodejs -y
RUN npm install -g npm
RUN npm install -g n
RUN n 0.12
RUN npm install -g gulp
RUN apt-get install python g++ -y

EXPOSE 4000
