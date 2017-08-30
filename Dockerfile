FROM php:7-fpm

RUN apt-get update -y && \
  DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y \
      openssl \
      zip \
      unzip \
      git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mbstring

RUN composer install
