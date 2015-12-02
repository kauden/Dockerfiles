FROM ubuntu:14.10

MAINTAINER Thierry Corbin <thierry.corbin@kauden.fr>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu utopic main universe" > /etc/apt/sources.list && \
    apt-get update && \
    apt-get -y install nginx \
    curl \
    wget \
    supervisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ADD asset/default /opt/default

RUN cp -f /opt/default /etc/nginx/sites-available/default && \
    echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    mkdir /site && \
    chown www-data:www-data /site

VOLUME ["/etc/nginx/conf.d", "/etc/nginx/sites-enabled", "/var/log/nginx"]

EXPOSE 80 443

CMD nginx
