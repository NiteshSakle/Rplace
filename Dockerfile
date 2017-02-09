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

# installing composer 
RUN mkdir /var/www/html/Rplace 
RUN chown -R www-data:www-data /var/www/html/Rplace
COPY / /var/www/html/Rplace

#RUN	curl -sS https://getcomposer.org/installer \
#    | php -- --install-dir=/usr/local/bin --filename=composer

RUN chmod -R 777 /var/www/html/Rplace/data/cache
# to unzip the pacakages dowloaded from git an install git 
RUN apt-get install zip unzip
RUN apt-get -y install git

WORKDIR /var/www/html/Rplace
RUN php composer.phar install 

COPY config/autoload/local.php.dist config/autoload/local.php

VOLUME  ["/var/www/html/Rplace/data_rplace", "/var/lib/mysql"]

EXPOSE 80
CMD ["/usr/bin/supervisord"]