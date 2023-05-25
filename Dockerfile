#Dockerfile.
FROM php:apache-bullseye

ARG DOKUWIKI_VERSION=2023-04-04a
ARG DEBIAN_FRONTEND="noninteractive"

VOLUME /var/www/html/conf
VOLUME /var/www/html/data

RUN apt-get update -y && apt upgrade -y && apt-get install git curl -y
RUN rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*
RUN a2enmod rewrite 
RUN cd /var/www/html \
    && curl --remote-name https://download.dokuwiki.org/src/dokuwiki/dokuwiki-${DOKUWIKI_VERSION}.tgz \
    && tar -xzvf dokuwiki-${DOKUWIKI_VERSION}.tgz --strip-components=1 \
    && rm dokuwiki-${DOKUWIKI_VERSION}.tgz
RUN cd /var/www/html/lib/images/smileys && git clone https://github.com/davidjimenez75/dokuwiki-smileys-local local
RUN cd /var/www/html/lib/tpl/ && git clone https://github.com/giterlizzi/dokuwiki-template-bootstrap3 bootstrap3
RUN mv /var/www/html/conf /var/www/html/conf.default
RUN mv /var/www/html/data /var/www/html/data.default

COPY docker-php-entrypoint /usr/local/bin
COPY htaccess /var/www/html/.htaccess
COPY smileys.local.conf /var/www/html/conf.default

RUN chown -R www-data:www-data /var/www/

# HTTP
EXPOSE 80/tcp

LABEL maintainer="me@alandoyle.com"
