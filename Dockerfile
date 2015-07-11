FROM debian:jessie
MAINTAINER Matthias Nüßler <m.nuessler@web.de>

LABEL Description="A TLS termination proxy using pound"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pound && apt-get clean

RUN mkdir -p /var/run/pound && chown www-data:www-data /var/run/pound

EXPOSE 4443

COPY pound.cfg /etc/pound/
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]