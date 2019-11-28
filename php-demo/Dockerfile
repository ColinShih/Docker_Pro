FROM trafex/alpine-nginx-php7:latest
MAINTAINER ColinShih
COPY src/. /var/www/html
COPY config/php-fpm.conf /etc/php7
COPY config/php.ini /etc/php7
COPY config/nginx.conf /etc/nginx
