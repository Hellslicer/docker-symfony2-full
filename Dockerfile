FROM php:7.0-fpm
RUN apt-get update && apt-get install -y git && rm -r /var/lib/apt/lists/* \
 && docker-php-ext-install -j$(nproc) opcache json mysqli pdo_mysql \
 && pecl install xdebug \
 && docker-php-ext-enable xdebug \
 && git clone https://github.com/phpredis/phpredis.git && cd phpredis && git checkout php7 && phpize && ./configure && make && make install && rm -rf phpredis \
 && docker-php-ext-enable redis
WORKDIR /srv
