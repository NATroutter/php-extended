ARG PHP_VERSION=8.5
FROM php:${PHP_VERSION}-fpm-alpine

# Install dependencies
RUN apk add --no-cache --quiet \
	freetype-dev \
	libjpeg-turbo-dev \
	libpng-dev \
	libzip-dev \
	libmemcached-dev \
	build-base \
	autoconf

# Install PHP extensions
RUN docker-php-ext-install -j$(nproc) \
	pdo_mysql \
	zip \
	gd \
	bcmath

# Install PECL extensions
RUN pecl install memcached redis && docker-php-ext-enable memcached redis


USER www-data
WORKDIR /var/www/html