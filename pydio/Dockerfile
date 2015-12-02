FROM centos:centos6

MAINTAINER Thierry Corbin <thierry.corbin@kauden.fr>

ENV PYDIO_VERSION 6.0.8

RUN yum install -y wget && \
    rpm -Uvh http://dl.ajaxplorer.info/repos/pydio-release-1-1.noarch.rpm && \
    wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm && \
    wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm && \
    wget http://dl.ajaxplorer.info/repos/el6/pydio-stable/pydio-${PYDIO_VERSION}-1.noarch.rpm && \
    rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm && \
    yum -y update && \
    yum -y install httpd \
    php-mcrypt* \
    ImageMagick \
    ImageMagick-devel \
    ImageMagick-perl \
    gcc \
    cc \
    php-pecl-apc \
    php \
    php-mysql \
    php-cli \
    php-devel \
    php-gd \
    php-pecl-memcache \
    php-pspell \
    php-snmp \
    php-xmlrpc \
    php-xml \
    php-ioncube-loader \
    python-setuptools \
    ssmtp && \
    rpm -Uvh pydio-${PYDIO_VERSION}-1.noarch.rpm && \
    yum clean all && \
    rm *.rpm && \
    mkdir -p /opt/pydio && \
    easy_install supervisor

COPY asset/* /opt/pydio/

RUN cp -f /opt/pydio/supervisord.conf /etc/ && \
    cp -f /opt/pydio/httpd.conf /etc/httpd/conf/ && \
    chmod +x /opt/pydio/pre_conf_pydio.sh && \
    chmod +x /opt/pydio/configure_php_modules.sh && \
    /opt/pydio/configure_php_modules.sh && \
    /opt/pydio/pre_conf_pydio.sh && \
    sed -i '/^sendmail_path/c\sendmail_path = /usr/sbin/ssmtp -t' /etc/php.ini

VOLUME ["/var/lib/pydio", "/var/cache/pydio"]

EXPOSE 80

CMD ["supervisord", "-n"]