#!/bin/bash

cd /etc/jarvis

echo "Copy environment"
cp .env.example .env

echo "Installing dependencies"
php artisan key:generate
composer install --quiet

echo "Configure environment"
sed -i "s/APP_ENV=local.*/APP_ENV=production/" /etc/nginx/nginx.conf

echo "Linking jarvis binary"
ln -s /etc/jarvis/artisan /usr/bin/jarvis