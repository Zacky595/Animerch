FROM php:8.2-apache

# Install sistem yang dibutuhkan Laravel
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zip unzip git
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && docker-php-ext-install gd pdo pdo_mysql

# Aktifkan rewrite mode untuk Laravel
RUN a2enmod rewrite

# Set folder kerja
WORKDIR /var/www/html
COPY . .

# Set hak akses folder
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN composer install --no-dev --optimize-autoloader

# Ganti DocumentRoot Apache ke folder public Laravel
RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf