FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive 

RUN apt-get update \
    && apt-get install -yq apache2 php curl \
    && curl -sS https://getcomposer.org/installer | \
        php -- --install-dir=/usr/bin/ --filename=composer

COPY style.css /var/www/html/
COPY index.html /var/www/html/

CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]