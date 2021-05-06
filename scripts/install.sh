#!/bin/bash

source /etc/stool/scripts/helpers.sh

echo "Initialization..."
bash /etc/stool/scripts/partials/init.sh

echo "Installing system tools"
bash /etc/stool/scripts/partials/system-tools.sh

echo "Add repos"
bash /etc/stool/scripts/partials/apt-repos.sh
