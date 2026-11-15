FROM php:8.2-apache
RUN docker-php-ext-install mysqli pdo pdo_mysql
COPY . /var/www/html/
EXPOSE 8080
CMD ["bash", "-lc", "a2dismod mpm_event mpm_worker || true; rm -f /etc/apache2/mods-enabled/mpm_event.* /etc/apache2/mods-enabled/mpm_worker.* || true; a2enmod mpm_prefork; sed -i 's/Listen 80/Listen 8080/g' /etc/apache2/ports.conf; sed -i 's/:80/:8080/g' /etc/apache2/sites-available/000-default.conf; apache2-foreground"]
