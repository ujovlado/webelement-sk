FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive

# upgrade the system
RUN apt-get update && apt-get upgrade -y

# install base tools
RUN apt-get install git mc curl vim wget -y

# set vim as default editor
RUN update-alternatives --set editor /usr/bin/vim.basic

# ruby and other dependencies, then required gems
RUN apt-get install ruby ruby-dev make ca-certificates gcc -y
RUN gem install jekyll jekyll-sitemap jekyll-redirect-from

# install node and tools
RUN curl --silent --location https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install nodejs -y
RUN apt-get install g++ -y

# less, gulp and bower
RUN npm install -g less gulp bower

ARG userId
ARG groupId

RUN addgroup --gid $groupId dockergroup
RUN adduser --uid $userId --gid $groupId --quiet --disabled-login --system dockeruser