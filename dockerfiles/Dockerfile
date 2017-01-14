FROM mrsu/nginx-php
MAINTAINER Su Zhongping <marioasu@163.com>

RUN apt-get update && \
    apt-get install -y \
    git \
    bsdiff \
    php7.0-bcmath \
    php-apcu \
    php7.0-curl \
    php7.0-gd \
    php7.0-intl \
    php7.0-mcrypt \
    php7.0-sqlite3 \
    php7.0-ldap \
    php-igbinary

COPY etc /etc
COPY config /config

ENV WEB_HOME=/srv/blog

VOLUME ${WEB_HOME}

WORKDIR /data/logs
