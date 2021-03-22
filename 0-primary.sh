#!/bin/bash
#
###############################################################################################
# To be run on fresh Linux Mint install.  Installs ZohoAssist Unattended Remote Service and
# other required software, sets themes, etc.
###############################################################################################

# create temporary working directory
mkdir -p ~/Downloads/hwr-temp && cd ~/Downloads/hwr-temp/

# Run the install script
wget -qO- https://raw.githubusercontent.com/auromak/hwr-post-install/main/1-zoho-install.sh | bash

# Run the theming script
wget -qO- https://raw.githubusercontent.com/auromak/hwr-post-install/main/2-user-theme.sh | bash

# Run the settings script
wget -qO- https://raw.githubusercontent.com/auromak/hwr-post-install/main/3-user-settings.sh | bash

# Cleanup
echo ""
echo "Cleaning up temporary files..."
rm -r ~/Downloads/hwr-temp
echo "Done!"

# Make one of the scripts optional
#while true; do
#    read -p "Would you like to apply changes to current user? " yn
#    case $yn in
#        [Yy]* ) wget -qO- https://raw.githubusercontent.com/auromak/hwr-post-install/main/2-user-theme.sh | bash; break;;
#        [Nn]* ) echo -e "Ok then, maybe next time.\n"; break;;
#        * ) echo "Please answer yes or no.";;
#    esac
#done
