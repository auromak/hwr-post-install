#!/bin/bash
#
###############################################################################################
# To be run on fresh Linux Mint install.  Installs ZohoAssist Unattended Remote Service and
# other required software, sets themes, etc.
###############################################################################################

applet_dir=/usr/share/cinnamon/applets/
extensions_dir=/usr/share/cinnamon/extensions/
papirus_dir=/usr/share/icons/Papirus/
hwr_dir=/usr/share/hwrescue/
RED='\033[0;31m'
GREEN='\033[0;32m'
CLEAR='\033[0m'

echo ""
echo "################   Installing core software   ##################"
echo ""

sudo apt update && sudo apt upgrade -y
sudo apt install -y curl unzip dconf-editor

sudo mkdir -p "${hwr_dir}"

# Check for and install Papirus icons and misc applets (Skips all if Papirus is found)
if [ -d "$papirus_dir" ]
then
	echo -e "\nPapirus is already ${GREEN}installed${CLEAR}. Skipping..."
else
# Install Papirus Icons
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | bash

# Install Applets
wget https://cinnamon-spices.linuxmint.com/files/applets/Cinnamenu@json.zip && sudo unzip Cinnamenu@json.zip -d "$applet_dir"
wget https://cinnamon-spices.linuxmint.com/files/applets/weather@mockturtl.zip && sudo unzip weather@mockturtl.zip -d "$applet_dir"

# Install Extensions
wget https://cinnamon-spices.linuxmint.com/files/extensions/watermark@germanfr.zip && sudo unzip watermark@germanfr.zip -d "$extensions_dir"
sudo wget -O "$hwr_dir"hwr-watermark.svg https://raw.githubusercontent.com/auromak/hwr-post-install/main/HWR7-watermark-white-optimized-FINAL.svg
fi

# Check for and install ZohoAssist Unattended
dpkg -l zohoassist > /dev/null 2>&1
INSTALLED=$?
if [ $INSTALLED == '0' ]; then
	echo -e "\nZohoAssist is already ${GREEN}installed${CLEAR}. Skipping..."
else
	wget "https://assist.zoho.com/api/v2/install_urs?type=2&encapiKey=wSsVRa12%2BhehD%2F0uyTCsIrxrnQxUBluiFxx631Wk4nX5GqjE88c9xEKdAFOnGfkWFzJtQDNBpr14zUpU1TMGjtwtmAsAWSiF9mqRe1U4J3x1pL7mlDPPW21dkxOILIoLwwxtkg%3D%3D&app=linux&version=64bit&isDebian=true" -O zohoassist_1.0.0.1.deb
	sudo dpkg -i zohoassist_1.0.0.1.deb
fi

# Additional configurations
# ...
# ...

echo ""
echo -e "###############   ${GREEN}Finished installing software${CLEAR}   ###############"
echo ""
