#!/bin/bash

echo "Adding apt repository for nginx mainline"
cat << EOF > /etc/apt/sources.list.d/nginx.list
deb [arch=amd64] http://nginx.org/packages/mainline/ubuntu/ focal nginx
deb-src http://nginx.org/packages/mainline/ubuntu/ focal nginx
EOF
wget http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key
rm nginx_signing.key

echo "Adding apt repository for php"
add-apt-repository ppa:ondrej/php

apt update -y