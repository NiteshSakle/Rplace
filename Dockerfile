FROM php:7-apache

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-install -j$(nproc) pdo pdo_mysql

RUN apt-get install vim -y

#supervisord
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN a2enmod rewrite

CMD ["/usr/bin/supervisord"]

ENV DEBIAN_FRONTEND noninteractive

# Adding the official Oracle MySQL APT repositories to install MySQL 5.6 (including the apt-get key)
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 5072E1F5
RUN echo "deb http://repo.mysql.com/apt/debian/ jessie mysql-5.6" >> /etc/apt/sources.list

# mysql
RUN apt-get update -y
RUN apt-get install -y mysql-client mysql-server python-mysqldb

# copy supervisor file with added mysql start command
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# setup mysql
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
ADD set-mysql-password.sh /tmp/set-mysql-password.sh
RUN /bin/sh /tmp/set-mysql-password.sh

RUN mkdir /var/www/html/Rplace
VOLUME  ["/var/www/html/Rplace/data_rplace", "/var/lib/mysql"]

EXPOSE 80
CMD ["/usr/bin/supervisord"]