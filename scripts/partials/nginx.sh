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