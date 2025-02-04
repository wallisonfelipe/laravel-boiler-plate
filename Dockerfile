FROM php:8.2-apache

ENV COMPOSER_ALLOW_SUPERUSER=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    openssl \
    libssl-dev \
    procps \
    htop \
    vim \
    wget \
    libzip-dev \
    libpq-dev \
    libcurl4-openssl-dev \
    pkg-config \
    libbrotli-dev

RUN apt-get -y update \
&& apt-get install -y libicu-dev \
&& docker-php-ext-configure intl \
&& docker-php-ext-install intl
   

# Install PHP extensions
RUN docker-php-ext-configure intl \
    && docker-php-ext-install intl \
    && pecl install swoole \
    && docker-php-ext-enable swoole

RUN apt-get update; \
    apt-get install -y libmagickwand-dev; \
    pecl install imagick; \
    docker-php-ext-enable imagick;

# Install necessary dependencies and GD with WebP support
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libzip-dev \
    zlib1g-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install gd

RUN docker-php-ext-enable gd

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql pdo_pgsql mbstring exif pcntl bcmath gd sockets zip gd

# Copy Apache configuration
# COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html

COPY . .

# Install composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN composer install

# Expose necessary ports
EXPOSE 80
EXPOSE 8000

ENTRYPOINT [ "composer", "dev"]