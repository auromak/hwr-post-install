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
echo "################   Installing core software   ##################"
echo ""

# Update current system and install basic software
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl unzip

# create temporary working directory
mkdir -p ~/Downloads/hwr-temp
cd ~/Downloads/hwr-temp/

# Check for and install ZohoAssist Unattended Access Client
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
# Install Papirus Icons
wget -qO- https://raw.githubusercontent.com/PapirusDevelopmentTeam/papirus-icon-theme/master/install.sh | sh

# Install Applets
wget https://cinnamon-spices.linuxmint.com/files/applets/Cinnamenu@json.zip && sudo unzip Cinnamenu@json.zip -d "$appletdir"
wget https://cinnamon-spices.linuxmint.com/files/applets/weather@mockturtl.zip && sudo unzip weather@mockturtl.zip -d "$appletdir"
fi

# Additional configurations


# Cleanup
#rm -r ~/Downloads/hwr-temp

echo ""
echo "#################   Core software installed   ##################"
echo ""

while true; do
    read -p "Would you like to apply changes to this user? " yn
    case $yn in
        [Yy]* ) wget -qO- https://raw.githubusercontent.com/auromak/hwr-post-install/main/2-user-theme.sh | sh; break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "am I still running?"
