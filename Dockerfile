FROM php:8.5-fpm-alpine

# Install dependencies
RUN apk add --no-cache \
	mysql-client \
	freetype-dev \
	libjpeg-turbo-dev \
	libpng-dev \
	libzip-dev \
	curl-dev \
	libxml2-dev \
	oniguruma-dev \
	memcached-dev \
	icu-dev

# Install PHP extensions
RUN docker-php-ext-install -j$(nproc) \
	pdo_mysql \
	mysqli \
	zip \
	gd \
	intl

# Install PECL extensions
RUN pecl install memcached redis && \
	docker-php-ext-enable memcached redis


USER www-data
WORKDIR /var/www/html