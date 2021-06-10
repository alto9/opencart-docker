FROM php:7.4.16-apache-buster

ARG MD5
ARG VER

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y libpng-dev libjpeg-dev libmcrypt-dev libzip-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-jpeg  \
    && docker-php-ext-install gd mysqli zip \
    && pecl install mcrypt-1.0.3 \
    && docker-php-ext-enable mcrypt

WORKDIR /var/www/html

ENV OPENCART_URL https://github.com/opencart/opencart/archive/${VER}.tar.gz

RUN set -xe \
    && curl -sSL ${OPENCART_URL} -o opencart.tar.gz \
    && echo "${MD5} opencart.tar.gz" | md5sum -c \
    && tar xzf opencart.tar.gz --strip 2 --wildcards '*/upload/' \
    && mv config-dist.php config.php \
    && mv admin/config-dist.php admin/config.php \
    && rm opencart.tar.gz \
    && chown -R www-data:www-data /var/www
