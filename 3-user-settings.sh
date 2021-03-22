#!/bin/bash
#
##################################################################################################################

RED='\033[0;31m'
GREEN='\033[0;32m'
CLEAR='\033[0m'

#tar -cpvf /home/oem/Desktop/configs.tar /home/oem/.cinnamon/configs/
wget -O ~/Downloads/hwr-temp/configs.tar https://github.com/auromak/hwr-post-install/raw/main/configs.tar
sudo tar -xpf ~/Downloads/hwr-temp/configs.tar -C /

echo ""
echo -e "#################   ${GREEN}User settings applied${CLEAR}   ################"
echo ""
