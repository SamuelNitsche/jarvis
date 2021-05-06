#!/bin/bash

source /etc/jarvis/scripts/helpers.sh

echo "Creating system user"
useradd jarvis
mkdir -p /home/jarvis/.ssh
adduser jarvis sudo
chsh -s /bin/bash jarvis
cp /root/.profile /home/jarvis/.profile
cp /root/.bashrc /home/jarvis/.bashrc

echo "Copy source control public keys"
ssh-keyscan -H github.com >> /home/jarvis/.ssh/known_hosts
ssh-keyscan -H bitbucket.org >> /home/jarvis/.ssh/known_hosts
ssh-keyscan -H gitlab.com >> /home/jarvis/.ssh/known_hosts

echo "Setup directory permissions"
chown -R jarvis:jarvis /home/jarvis
chmod -R 755 /home/jarvis
chmod 700 /home/jarvis/.ssh/id_rsa

echo "Allow php-fpm restart"
echo "jarvis ALL=NOPASSWD: /usr/sbin/service php8.0-fpm reload" >> /etc/sudoers.d/php-fpm