#!/bin/bash

source /etc/jarvis/scripts/helpers.sh

cat << "EOF"
    _                  _              ___   ___   _
   (_) __ _ _ ____   _(_)___  __   __/ _ \ / _ \ / |
   | |/ _` | '__\ \ / / / __| \ \ / / | | | | | || |
   | | (_| | |   \ V /| \__ \  \ V /| |_| | |_| || |
  _/ |\__,_|_|    \_/ |_|___/   \_/  \___(_)___(_)_|
 |__/

                By Samuel Nitsche


EOF

echo "Initialization..."
source /etc/jarvis/scripts/partials/init.sh

echo "Installing system tools"
source /etc/jarvis/scripts/partials/system-tools.sh

echo "Add repos"
source /etc/jarvis/scripts/partials/apt-repos.sh

echo "Setup user"
source /etc/jarvis/scripts/partials/user.sh

echo "Setup webserver"
source /etc/jarvis/scripts/partials/nginx.sh

echo "Setup database server"
source /etc/jarvis/scripts/partials/mysql.sh

echo "Setup certbot"
source /etc/jarvis/scripts/partials/certbot.sh

echo "Setup php"
source /etc/jarvis/scripts/partials/php.sh

echo "Setup composer"
source /etc/jarvis/scripts/partials/composer.sh

echo "Setup firewall"
source /etc/jarvis/scripts/partials/ufw.sh

echo "Setup finished successfully. The system is now ready."