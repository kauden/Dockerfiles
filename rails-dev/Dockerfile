FROM ubuntu:14.04

MAINTAINER Thierry Corbin <thierry.corbin@kauden.fr>

ENV DEBIAN_FRONTEND noninteractive

ENV RUBY_VERSION 2.2.3

RUN apt-get update && \
    apt-get -y install \
    git-core \
    curl \
    zlib1g-dev \
    build-essential \
    libssl-dev \
    libreadline-dev \
    libyaml-dev \
    libsqlite3-dev \
    sqlite3 \
    libxml2-dev \
    libxslt1-dev \
    libcurl4-openssl-dev \
    python-software-properties \
    software-properties-common \
    libffi-dev \
    supervisor \
    libmysqlclient-dev \
    imagemagick \
    wkhtmltopdf && \
    add-apt-repository ppa:chris-lea/node.js && \
    apt-get update && \
    apt-get -y install nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN cd /opt && \
    curl -L -o ruby-${RUBY_VERSION}.tar.gz "http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-${RUBY_VERSION}.tar.gz" && \
    tar -xzvf ruby-${RUBY_VERSION}.tar.gz && \
    rm -f ruby-${RUBY_VERSION}.tar.gz && \
    cd ruby-${RUBY_VERSION}/ && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -rf ruby-${RUBY_VERSION}/

RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc && \
    gem install bundler

ADD asset/init.sh /opt/init.sh
ADD asset/wkhtmltopdf-0.11 /usr/local/bin/wkhtmltopdf
ADD asset/ror /bin/ror

RUN chmod 755 /opt/init.sh && \
    chmod 755 /bin/ror && \
    mkdir /root/.ssh && \
    groupadd -g 501 -r rails && \
    useradd -r -u 501 -g 501 -s /bin/bash -d /home/rails -m rails && \
    mkdir /site && \
    chown rails:rails /site

EXPOSE 3000

CMD /opt/init.sh
