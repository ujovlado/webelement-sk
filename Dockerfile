FROM ubuntu:14.10
MAINTAINER ujovlado@gmail.com

# upgrade the system
RUN apt-get update
RUN apt-get upgrade -y

# ruby and other dependencies, then required gems
RUN apt-get install ruby ruby-dev make nodejs ca-certificates gcc -y
RUN gem install jekyll jekyll-sitemap jekyll-redirect-from

RUN mkdir -p /jekyll

EXPOSE 4000