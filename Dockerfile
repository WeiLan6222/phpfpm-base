#--------------------------------------------------------------------------
# Image Setup
#--------------------------------------------------------------------------

FROM php:7.2.2-fpm

MAINTAINER Wei Lan <wei.lan6222@gmail.com>

#--------------------------------------------------------------------------
# Software's Installation
#--------------------------------------------------------------------------

# Installing tools and PHP extentions using "apt", "docker-php", "pecl",
# Install "curl", "libmemcached-dev", "libpq-dev", "libjpeg-dev",
# "libpng-dev", "libfreetype6-dev", "libssl-dev", "libmcrypt-dev"

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    curl \
    libmemcached-dev \
    libz-dev \
    libpq-dev \
    libjpeg-dev \
    libpng-dev \
    libfreetype6-dev \
    libssl-dev \
    libmcrypt-dev \
  && rm -rf /var/lib/apt/lists/*

# Install the PHP pdo_mysql extention
RUN docker-php-ext-install pdo_mysql \
# Install the PHP gd library
  && docker-php-ext-configure gd \
    --enable-gd-native-ttf \
    --with-jpeg-dir=/usr/lib \
    --with-freetype-dir=/usr/include/freetype2 && \
    docker-php-ext-install gd