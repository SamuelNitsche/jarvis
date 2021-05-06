#!/bin/bash

source /etc/jarvis/scripts/helpers.sh

echo "Install nginx"
execSilent apt-get install nginx -y

echo "Initial nginx configuration"
sed -i "s/user www-data;/user jarvis;/" /etc/nginx/nginx.conf
sed -i "s/worker_processes.*/worker_processes auto;/" /etc/nginx/nginx.conf
sed -i "s/# multi_accept.*/multi_accept on;/" /etc/nginx/nginx.conf
sed -i "s/# server_tokens.*/server_tokens off;/" /etc/nginx/nginx.conf
sed -i "s/# server_names_hash_bucket_size.*/server_names_hash_bucket_size 128;/" /etc/nginx/nginx.conf
sed -i "s/ssl_protocols.*/ssl_protocols TLSv1.2 TLSv1.3;/" /etc/nginx/nginx.conf
execVerySilent rm /etc/nginx/sites-enabled/default
execVerySilent rm /etc/nginx/sites-available/default
execVerySilent rm -Rf /var/www/html/*
execVerySilent mkdir -p /home/jarvis/localhost/public/
execSilent cp /etc/jarvis/templates/nginx/index.php /home/jarvis/localhost/public/index.php
cat << EOF > /etc/nginx/sites-available/localhost
server {
  listen 80 default_server;
  root /home/jarvis/localhost/public;
  index index.php;

  location ~ \.php$ {
    try_files $uri /index.php =404;
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass unix:/run/php/php8.0-fpm.sock;
    fastcgi_buffers 16 16k;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
    include fastcgi_params;
  }
}
execSilent ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
EOF