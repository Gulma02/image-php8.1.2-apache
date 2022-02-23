FROM php:8.1.2-apache

COPY . /var/www
WORKDIR /var/www
RUN apt-get -y update \
    && apt-get install -y libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

RUN a2enmod rewrite

EXPOSE 80