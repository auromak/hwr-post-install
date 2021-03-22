#!/bin/bash
#
##################################################################################################################

RED='\033[0;31m'
GREEN='\033[0;32m'
CLEAR='\033[0m'

mkdir -p ~/Downloads/hwr-temp && cd ~/Downloads/hwr-temp/
#tar -cmvf /home/oem/Desktop/configs.tar /home/oem/.cinnamon/configs/
wget -O ~/Downloads/hwr-temp/configs.tar https://github.com/auromak/hwr-post-install/raw/main/2021-03-22-1654-backup.tar
sudo tar -xmvf ~/Downloads/hwr-temp/configs.tar -C ~/

wget -O ~/Downloads/hwr-temp/backup_of_my_cinnamon_settings https://github.com/auromak/hwr-post-install/raw/main/backup_of_my_cinnamon_settings
dconf load /org/cinnamon/ < backup_of_my_cinnamon_settings
# -xpf

echo ""
echo -e "#################   ${GREEN}User settings applied${CLEAR}   ################"
echo ""



# #tar -cmvf /home/oem/Desktop/configs.tar /home/oem/.cinnamon/configs/
# wget -O ~/Downloads/hwr-temp/configs.tar https://github.com/auromak/hwr-post-install/raw/main/configs.tar
# sudo tar -xmvf ~/Downloads/hwr-temp/configs.tar -C /
