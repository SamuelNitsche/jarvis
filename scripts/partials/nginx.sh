#!/bin/bash

source /etc/stool/scripts/helpers.sh

echo "Install nginx"
execSilent apt install nginx -y

echo "Initial nginx configuration"
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
sed -i "s/worker_processes.*/worker_processes auto;/" /etc/nginx/nginx.conf
sed -i "s/# multi_accept.*/multi_accept on;/" /etc/nginx/nginx.conf
sed -i "s/# server_names_hash_bucket_size.*/server_names_hash_bucket_size 128;/" /etc/nginx/nginx.conf
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
rm -Rf /var/www/html/*