#!/bin/bash
#
###############################################################################################
# To be run on fresh Linux Mint install.  Installs ZohoAssist Unattended Remote Service and
# other required software, sets themes, etc.
###############################################################################################

wget -qO- https://raw.githubusercontent.com/auromak/hwr-post-install/main/1-zoho-install.sh | bash

while true; do
    read -p "Would you like to apply changes to current user? " yn
    case $yn in
        [Yy]* ) wget -qO- https://raw.githubusercontent.com/auromak/hwr-post-install/main/2-user-theme.sh | bash; break;;
        [Nn]* ) echo "Ok then, maybe next time."; break;;
        * ) echo "Please answer yes or no.";;
    esac
done
