# 8.0-rc-apache
# 7.4-rc-apache
# 7.2-rc-apache
# php:apache
FROM php:8.0-rc-apache
RUN apt update && \
    apt install -y zlib1g libfreetype6-dev libjpeg62-turbo-dev libpng-dev libicu-dev wget && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd && \
    docker-php-ext-install mysqli pdo_mysql exif intl && \
    apt clean autoclean && \
    apt autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ && \
    wget https://github.com/drush-ops/drush/releases/download/8.4.11/drush.phar && \
    chmod +x drush.phar && \
    mv drush.phar /usr/bin/drush
COPY ./assets/apache2.conf /etc/apache2/
