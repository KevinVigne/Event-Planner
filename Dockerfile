# Depuis php 8.2
FROM php:8.2-fpm

# Ajoute les extensions pdo et pdo_mysql 
RUN docker-php-ext-install pdo pdo_mysql

# Règle la timezone sur Paris
RUN ln -snf /usr/share/zoneinfo/Europe/Paris /etc/localtime \
    && echo "Europe/Paris" > /etc/timezone

# Installation de Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Dans le chemin suivant 
WORKDIR /var/www/html

# Copie composer. json et composer.lock     
COPY composer.json composer.lock* ./

# Installation des dépendances
RUN composer install --no-dev --optimize-autoloader

# Copie du reste du projet
COPY . .

# Génération d'autoload en préventif
RUN composer dump-autoload --optimize