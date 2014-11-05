FROM debian:wheezy

ENV DEBIAN_FRONTEND noninteractive

VOLUME ["/var/lib/mysql"]

ENTRYPOINT ["true"]