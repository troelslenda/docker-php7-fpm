FROM php:7-fpm

RUN apt-get update -y && \
  DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y \
      openssl \
      unzip \
      git

RUN  docker-php-ext-install mysqli mysqlnd pdo pdo_mysql zip mbstring

# Setup the Composer installer
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
  && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
  && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }"

EXPOSE 9000