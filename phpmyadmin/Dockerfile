FROM kauden/nginx-fpm

MAINTAINER Thierry Corbin <thierry.corbin@kauden.fr>

ENV BASEDIR /site
ENV PHPMYADMIN_VERSION 4.5.2

WORKDIR ${BASEDIR}

RUN sed -i '/post_max_size =/c \post_max_size = 30M' /etc/php5/fpm/php.ini && \
    sed -i '/upload_max_filesize =/c \upload_max_filesize = 30M' /etc/php5/fpm/php.ini && \
    sed -i '/    server_name/a \ \ \ \ client_max_body_size 30M;' /etc/nginx/sites-available/default && \
    curl -L -o phpmyadmin.tar.gz "http://sourceforge.net/projects/phpmyadmin/files/phpMyAdmin/${PHPMYADMIN_VERSION}/phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages.tar.gz" && \
    tar -C ${BASEDIR} -xf ${BASEDIR}/phpmyadmin.tar.gz phpMyAdmin-${PHPMYADMIN_VERSION}-all-languages --strip=1 && \
    rm -f ${BASEDIR}/phpmyadmin.tar.gz && \
    chown www-data:www-data ${BASEDIR} -R
