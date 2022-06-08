FROM php:apache
RUN apt update && \
    apt install -y zlib1g libfreetype6-dev libjpeg62-turbo-dev libpng-dev libicu-dev && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd && \
    docker-php-ext-install mysqli pdo_mysql exif intl && \
    apt clean autoclean && \
    apt autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/
