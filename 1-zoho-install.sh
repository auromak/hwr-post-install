#!/bin/bash
#
###############################################################################################
# To be run on fresh Linux Mint install.  Installs ZohoAssist Unattended Remote Service and
# other required software, sets themes, etc.
###############################################################################################

zohodir=/usr/local/ZohoAssist/Service/
appletdir=/usr/share/cinnamon/applets/
papirusdir=/usr/share/icons/Papirus/
RED='\033[0;31m'
GREEN='\033[0;32m'
CLEAR='\033[0m'

echo ""
echo "################   Installing core software   ##################"
echo ""

sudo apt update && sudo apt upgrade -y
sudo apt install -y curl unzip

# create temporary working directory
mkdir -p ~/Downloads/hwr-temp && cd ~/Downloads/hwr-temp/

# Check for and install Papirus icons and misc applets (Skips all if Papirus is found)
if [ -d "$papirusdir" ]
then
	echo -e "\nPapirus is already ${GREEN}installed${CLEAR}. Skipping..."
else
# Install Papirus Icons
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | bash

# Install Applets
wget https://cinnamon-spices.linuxmint.com/files/applets/Cinnamenu@json.zip && sudo unzip Cinnamenu@json.zip -d "$appletdir"
wget https://cinnamon-spices.linuxmint.com/files/applets/weather@mockturtl.zip && sudo unzip weather@mockturtl.zip -d "$appletdir"
fi

# Check for and install ZohoAssist Unattended Access Client
# if [ -d "$zohodir" ]
# then
# 	echo -e "\nZohoAssist is already ${GREEN}installed${CLEAR}. Skipping..."
# else
# 	wget "https://assist.zoho.com/api/v2/install_urs?type=2&encapiKey=wSsVRa12%2BhehD%2F0uyTCsIrxrnQxUBluiFxx631Wk4nX5GqjE88c9xEKdAFOnGfkWFzJtQDNBpr14zUpU1TMGjtwtmAsAWSiF9mqRe1U4J3x1pL7mlDPPW21dkxOILIoLwwxtkg%3D%3D&app=linux&version=64bit&isDebian=true" -O zohoassist_1.0.0.1.deb
# 	sudo dpkg -i zohoassist_1.0.0.1.deb
# fi

dpkg -l zohoassist > /dev/null 2>&1
INSTALLED=$?
if [ $INSTALLED == '0' ]; then
	echo -e "\nZohoAssist is already ${GREEN}installllled${CLEAR}. Skipping..."
else
	wget "https://assist.zoho.com/api/v2/install_urs?type=2&encapiKey=wSsVRa12%2BhehD%2F0uyTCsIrxrnQxUBluiFxx631Wk4nX5GqjE88c9xEKdAFOnGfkWFzJtQDNBpr14zUpU1TMGjtwtmAsAWSiF9mqRe1U4J3x1pL7mlDPPW21dkxOILIoLwwxtkg%3D%3D&app=linux&version=64bit&isDebian=true" -O zohoassist_1.0.0.1.deb
	sudo dpkg -i zohoassist_1.0.0.1.deb
fi

# Additional configurations
# ...
# ...

# Cleanup
echo ""
echo "Cleaning up temporary files..."
rm -r ~/Downloads/hwr-temp

echo ""
echo -e "###############   ${GREEN}Finished installing software${CLEAR}   ###############"
echo ""
