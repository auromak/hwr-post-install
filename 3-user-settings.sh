#!/bin/bash
#
##################################################################################################################

RED='\033[0;31m'
GREEN='\033[0;32m'
CLEAR='\033[0m'

mkdir -p ~/Downloads/hwr-temp && cd ~/Downloads/hwr-temp/

# Load defaults into dconf
wget -O ~/Downloads/hwr-temp/configured-dconf-backup https://github.com/auromak/hwr-post-install/raw/main/configured-dconf-backup
dconf load /org/cinnamon/ < configured-dconf-backup
cinnamon --replace > /dev/null 2>&1 & disown

# Load settings
#tar -cmvf /home/oem/Desktop/configs.tar /home/oem/.cinnamon/configs/ # Deprecated, currently using Backup Tool in Mint
wget -O ~/Downloads/hwr-temp/configs.tar https://github.com/auromak/hwr-post-install/raw/main/2021-03-22-1919-backup.tar
rm -rf ~/.mozilla ~/.cinnamon
tar -xmvf ~/Downloads/hwr-temp/configs.tar -C ~/
# -xpf



echo ""
echo -e "#################   ${GREEN}User settings applied${CLEAR}   ################"
echo ""



# #tar -cmvf /home/oem/Desktop/configs.tar /home/oem/.cinnamon/configs/
# wget -O ~/Downloads/hwr-temp/configs.tar https://github.com/auromak/hwr-post-install/raw/main/configs.tar
# sudo tar -xmvf ~/Downloads/hwr-temp/configs.tar -C /
