#!/bin/bash
#
##################################################################################################################

RED='\033[0;31m'
GREEN='\033[0;32m'
CLEAR='\033[0m'

echo ""
echo "#################   Customize user interface   #################"
echo ""
echo "Writing configuration changes to dconf..."
sleep 10

dconf write /org/cinnamon/desktop/interface/clock-use-24h false
dconf write /org/cinnamon/alttab-switcher-style "'coverflow'"
dconf write /org/cinnamon/settings-daemon/plugins/power/lid-close-ac-action "'nothing'"

dconf write /org/cinnamon/panels-enabled "['1:0:bottom']"
dconf write /org/cinnamon/panels-height "['1:48']"
dconf reset /org/cinnamon/panel-zone-icon-sizes
dconf write /org/cinnamon/enabled-applets "['panel1:left:0:Cinnamenu@json','panel1:left:1:show-desktop@cinnamon.org','panel1:left:2:grouped-window-list@cinnamon.org','panel1:right:1:systray@cinnamon.org','panel1:right:2:xapp-status@cinnamon.org','panel1:right:3:notifications@cinnamon.org','panel1:right:4:printers@cinnamon.org','panel1:right:5:removable-drives@cinnamon.org','panel1:right:6:keyboard@cinnamon.org','panel1:right:7:favorites@cinnamon.org','panel1:right:8:network@cinnamon.org','panel1:right:9:sound@cinnamon.org','panel1:right:10:power@cinnamon.org','panel1:right:11:calendar@cinnamon.org','panel1:right:0:weather@mockturtl','panel1:right:12:scale@cinnamon.org:14']"
dconf write /org/cinnamon/enabled-extensions "['watermark@germanfr']"
dconf write /org/cinnamon/theme/name "'Mint-Y-Dark'"
dconf write /org/cinnamon/desktop/interface/gtk-theme "'Mint-Y-Dark'"
dconf write /org/cinnamon/desktop/interface/icon-theme "'Papirus-Dark'"
dconf write /org/cinnamon/desktop/wm/preferences/theme "'Mint-Y-Dark'"
cinnamon --replace > /dev/null 2>&1 & disown

# Alternative method using gsettings:
#gsettings set org.cinnamon.desktop.interface icon-theme Papirus-Dark
#gsettings set org.cinnamon.desktop.interface clock-use-24h false
#gsettings set org.cinnamon panels-height "['1:40']"

echo ""
echo -e "#################   ${GREEN}User interface customized${CLEAR}   ################"
echo ""
