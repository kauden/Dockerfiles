FROM ubuntu:14.04

MAINTAINER Thierry Corbin <thierry.corbin@kauden.fr>

RUN echo 'deb http://download.videolan.org/pub/debian/stable/ /' >> /etc/apt/sources.list && \
echo 'deb-src http://download.videolan.org/pub/debian/stable/ /' >> /etc/apt/sources.list && \
echo 'deb http://archive.ubuntu.com/ubuntu trusty main multiverse' >> /etc/apt/sources.list && \
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
apt-get update && \
apt-get -y install wget \
supervisor && \
wget -O - http://download.videolan.org/pub/debian/videolan-apt.asc|sudo apt-key add - && \
apt-get update && \
    apt-get -y install apache2 \
    php5 \
    php5-json \
    php5-curl \
    php5-mysqlnd \
    pwgen \
    lame \
    libvorbis-dev \
    vorbis-tools \
    flac \
    libmp3lame-dev \
    libavcodec-extra* \
    libfaac-dev \
    libtheora-dev \
    libvpx-dev \
    libav-tools && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* && \
rm -rf /tmp/*

ADD https://github.com/ampache/ampache/archive/develop.tar.gz /opt/ampache.tar.gz

ADD asset/supervisord.conf /opt/supervisord.conf

ADD asset/001-ampache.conf /etc/apache2/sites-available/

# extraction / installation
RUN rm -rf /var/www/* && \
tar -C /var/www -xf /opt/ampache.tar.gz ampache-develop --strip=1 && \
chown -R www-data /var/www && \
rm -rf /etc/apache2/sites-enabled/* && \
ln -s /etc/apache2/sites-available/001-ampache.conf /etc/apache2/sites-enabled/ && \
a2enmod rewrite

VOLUME ["/media", "/var/www/config", "/var/www/themes"]

EXPOSE 80

CMD /usr/bin/supervisord -c /opt/supervisord.conf
