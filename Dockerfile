FROM debian:wheezy

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y nginx

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

ADD vhost.conf /etc/nginx/sites-enabled/default
ADD entrypoint.sh /usr/local/bin/entrypoint.sh

EXPOSE 80

VOLUME ["/srv"]
WORKDIR /srv

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]