#!/bin/bash

source /etc/jarvis/scripts/helpers.sh

echo "Install mysql"

debconf-set-selections <<< \
  "mysql-community-server mysql-community-server/root-pass password $MYSQL_ROOT_PASSWORD"

debconf-set-selections <<< \
  "mysql-community-server mysql-community-server/re-root-pass password $MYSQL_ROOT_PASSWORD"

debconf-set-selections <<< \
  "mysql-community-server mysql-server/default-auth-override select Use Legacy Authentication Method (Retain MySQL 5.x Compatibility)"

DEBIAN_FRONTEND=noninteractive apt-get install mysql-server -y