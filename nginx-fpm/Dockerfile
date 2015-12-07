FROM docker.kauden.fr/kauden/nginx

MAINTAINER Thierry Corbin <thierry.corbin@kauden.fr>

ENV DEBIAN_FRONTEND noninteractive

ADD asset/* /opt/

RUN apt-get update && \
    apt-get -y install \
    php5 \
    php5-fpm \
    php5-gd \
    php5-ldap \
    php5-sqlite \
    php5-pgsql \
    php-pear \
    php5-mysql \
    php5-mcrypt \
    php5-xcache \
    php5-xmlrpc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    sed -i '/daemonize /c \daemonize = no' /etc/php5/fpm/php-fpm.conf && \
    sed -i '/;cgi.fix_pathinfo/c \cgi.fix_pathinfo=0' /etc/php5/fpm/php.ini && \
    cp -f /opt/default /etc/nginx/sites-available/default

RUN php5enmod mcrypt

CMD /usr/bin/supervisord -c /opt/supervisord.conf
