FROM debian:wheezy

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y wget && wget http://www.dotdeb.org/dotdeb.gpg && apt-key add dotdeb.gpg
RUN echo "deb http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
RUN echo "deb-src http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list
RUN echo "deb http://packages.dotdeb.org wheezy-php56 all" >> /etc/apt/sources.list
RUN echo "deb-src http://packages.dotdeb.org wheezy-php56 all" >> /etc/apt/sources.list

RUN apt-get update -y && apt-get install -y curl php5-cli php5-json php5-fpm php5-intl php5-mysqlnd

RUN echo "daemonize=no" > /etc/php5/fpm/pool.d/daemonize.conf
RUN sed -e "s,127.0.0.1:9000,9000," -i /etc/php5/fpm/pool.d/www.conf

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

EXPOSE 9000

ENTRYPOINT ["/usr/sbin/php5-fpm"]