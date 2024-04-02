FROM php:8.1-cli

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    supervisor

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd sockets

# Install Redis extension
RUN pecl update-channels && pecl install redis && docker-php-ext-enable redis

RUN chmod -R 777 /var/log/supervisor
RUN chmod -R 777 /var/run

COPY supervisord.conf /etc/supervisor/conf.d/laravel-worker.conf

EXPOSE 22 80

CMD ["/usr/bin/supervisord"]
