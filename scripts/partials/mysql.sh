#!/bin/bash

source /etc/jarvis/scripts/helpers.sh

echo "Install mysql"
export DEBIAN_FRONTEND=noninteractive
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD"
execSilent apt-get install mysql-server -y

echo "Create jarvis user"
mysql -uroot -p $MYSQL_ROOT_PASSWORD -e "CREATE USER 'jarvis'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mysql -uroot -p $MYSQL_ROOT_PASSWORD -e "GRANT ALL ON *.* TO 'jarvis'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;"
mysql -uroot -p $MYSQL_ROOT_PASSWORD -e "GRANT ALL ON *.* TO 'jarvis'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;"
mysql -uroot -p $MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"