FROM ubuntu:14.04
MAINTAINER Thierry Corbin <thierry.corbin@kauden.fr>

RUN echo "postfix postfix/mailname string gmail.com" | debconf-set-selections
RUN echo "postfix postfix/main_mailer_type string 'Internet Site'" | debconf-set-selections

RUN apt-get update && \
    apt-get install -y postfix \
    supervisor \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ADD asset/mail.sh /opt/mail.sh
ADD asset/postfix.sh /opt/postfix.sh
ADD asset/supervisord.conf /opt/supervisord.conf

RUN chmod +x /opt/mail.sh && \
    chmod +x /opt/postfix.sh

EXPOSE 25

ENTRYPOINT ["/opt/mail.sh"]
