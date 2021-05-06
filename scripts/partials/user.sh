#!/bin/bash

source /etc/jarvis/scripts/helpers.sh

echo "Creating system user"
execSilent useradd jarvis
execSilent mkdir -p /home/jarvis/.ssh
execSilent adduser jarvis sudo
execSilent chsh -s /bin/bash jarvis
execSilent cp /root/.profile /home/jarvis/.profile
execSilent cp /root/.bashrc /home/jarvis/.bashrc

echo "Copy source control public keys"
execSilent ssh-keyscan -H github.com >> /home/jarvis/.ssh/known_hosts
execSilent ssh-keyscan -H bitbucket.org >> /home/jarvis/.ssh/known_hosts
execSilent ssh-keyscan -H gitlab.com >> /home/jarvis/.ssh/known_hosts

echo "Setup directory permissions"
execSilent chown -R jarvis:jarvis /home/jarvis
execSilent chmod -R 755 /home/jarvis

echo "Allow php-fpm restart"
echo "jarvis ALL=NOPASSWD: /usr/sbin/service php8.0-fpm reload" >> /etc/sudoers.d/php-fpm