#!/bin/bash

source /etc/jarvis/scripts/helpers.sh

echo "Install mysql"
debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD"
execSilent apt-get install mysql-server -y