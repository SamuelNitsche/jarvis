#!/bin/bash

source /etc/jarvis/scripts/helpers.sh

echo "Install mysql"
echo 'mysql-community-server mysql-community-server/root-pass password root' | debconf-set-selections
echo 'mysql-community-server mysql-community-server/re-root-pass password root' | debconf-set-selections
echo 'mysql-community-server mysql-server/default-auth-override select Use Legacy Authentication Method (Retain MySQL 5.x Compatibility)' | debconf-set-selections
execSilent apt-get install mysql-server -y