#!/bin/bash

source /etc/jarvis/scripts/helpers.sh

echo "Install mysql"
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
apt-get -y install mysql-server

mysql -u root -proot -e "UPDATE mysql.user SET authentication_string=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root'"
mysql -u root -proot -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1')"
mysql -u root -proot -e "DELETE FROM mysql.user WHERE User=''"
mysql -u root -proot -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\_%'"
mysql -u root -proot -e "FLUSH PRIVILEGES"