#!/bin/bash

source /etc/stool/scripts/helpers.sh

cat << "EOF"
         __              __
   _____/ /_____  ____  / /
  / ___/ __/ __ \/ __ \/ /
 (__  ) /_/ /_/ / /_/ / /
/____/\__/\____/\____/_/
    By Samuel Nitsche
EOF

echo "Initialization..."
bash /etc/stool/scripts/partials/init.sh

echo "Installing system tools"
bash /etc/stool/scripts/partials/system-tools.sh

echo "Add repos"
bash /etc/stool/scripts/partials/apt-repos.sh

echo "Setup webserver"
bash /etc/stool/scripts/partials/nginx.sh

echo "Setup firewall"
bash /etc/stool/scripts/partials/ufw.sh
