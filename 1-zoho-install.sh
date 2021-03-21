#!/bin/bash
#
###############################################################################################
# To be run on fresh Linux Mint install.  Installs ZohoAssist Unattended Remote Service and
# other required software, sets themes, etc.
# save applets to: /usr/share/cinnamon/applets
###############################################################################################


zohodir=/usr/local/ZohoAssist/Service/
appletdir=/usr/share/cinnamon/applets/
papirusdir=/usr/share/icons/Papirus/

echo ""
echo "################################################################"
echo "################   Installing core software   ##################"
echo "################################################################"
echo ""
# Update current system
sudo apt update && sudo apt upgrade -y

# Install software from 'normal' repositories
sudo apt install -y curl unzip

###############################################################################################
# create temporary working directory
mkdir -p ~/Downloads/hwr-temp
cd ~/Downloads/hwr-temp/

# ZohoAssist Unattended Access Client
if [ -d "$zohodir" ]
then
	echo "ZohoAssist is already installed. Skipping..."
else
	wget "https://assist.zoho.com/api/v2/install_urs?type=2&encapiKey=wSsVRa12%2BhehD%2F0uyTCsIrxrnQxUBluiFxx631Wk4nX5GqjE88c9xEKdAFOnGfkWFzJtQDNBpr14zUpU1TMGjtwtmAsAWSiF9mqRe1U4J3x1pL7mlDPPW21dkxOILIoLwwxtkg%3D%3D&app=linux&version=64bit&isDebian=true" -O zohoassist_1.0.0.1.deb
	sudo dpkg -i zohoassist_1.0.0.1.deb
fi


if [ -d "$papirusdir" ]
then
	echo "Papirus is already installed. Skipping..."
else
# Papirus Icons
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | sh

# Applets
wget https://cinnamon-spices.linuxmint.com/files/applets/Cinnamenu@json.zip && sudo unzip Cinnamenu@json.zip -d "$appletdir"
wget https://cinnamon-spices.linuxmint.com/files/applets/weather@mockturtl.zip && sudo unzip weather@mockturtl.zip -d /usr/share/cinnamon/applets/
fi

# Additional configurations


#ending
#mkdir $HOME/Upload

###############################################################################################
# Cleanup
rm -r ~/Downloads/hwr-temp

echo ""
echo "################################################################"
echo "#################   Core software installed   ##################"
echo "################################################################"
echo ""
