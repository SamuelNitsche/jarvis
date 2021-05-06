#!/bin/bash

echo "Install nginx"
execSilent apt install nginx -y

echo "Initial nginx configuration"
rm /etc/nginx/nginx.conf
cp /etc/stool/templates/nginx/nginx.conf /etc/nginx/nginx.conf
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
rm -Rf /var/www/html/*