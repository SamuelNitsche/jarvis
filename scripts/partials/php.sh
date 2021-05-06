#!/bin/bash

source /etc/stool/scripts/helpers.sh

echo "Install php"
execSilent apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
  php8.0-fpm php8.0-cli php8.0-dev \
  php8.0-pgsql php8.0-sqlite3 php8.0-gd \
  php8.0-curl php8.0-memcached \
  php8.0-imap php8.0-mysql php8.0-mbstring \
  php8.0-xml php8.0-zip php8.0-bcmath php8.0-soap \
  php8.0-intl php8.0-readline

echo "Tweak php fpm configuration"
sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/8.0/fpm/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php/8.0/fpm/php.ini
sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php/8.0/fpm/php.ini
sed -i "s/memory_limit = .*/memory_limit = 512M/" /etc/php/8.0/fpm/php.ini
#sed -i "s/;date.timezone.*/date.timezone = UTC/" /etc/php/8.0/fpm/php.ini

echo "Tweak php fpm pool configuration"
#sed -i "s/^user = www-data/user = forge/" /etc/php/8.0/fpm/pool.d/www.conf
#sed -i "s/^group = www-data/group = forge/" /etc/php/8.0/fpm/pool.d/www.conf
#sed -i "s/;listen\.owner.*/listen.owner = forge/" /etc/php/8.0/fpm/pool.d/www.conf
#sed -i "s/;listen\.group.*/listen.group = forge/" /etc/php/8.0/fpm/pool.d/www.conf
sed -i "s/;listen\.mode.*/listen.mode = 0666/" /etc/php/8.0/fpm/pool.d/www.conf
sed -i "s/;request_terminate_timeout.*/request_terminate_timeout = 60/" /etc/php/8.0/fpm/pool.d/www.conf