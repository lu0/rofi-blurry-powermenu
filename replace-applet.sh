#!/bin/bash

# Copy the modification of the applet
sudo rm -rf /usr/share/cinnamon/applets/menu@cinnamon.org/applet.js
sudo cp -r applet.js /usr/share/cinnamon/applets/menu@cinnamon.org/

# Copy rofi files
sudo mkdir -p /usr/bin/
sudo cp -r powermenu.sh /usr/bin/
sudo cp -r fullscreen_powermenu.rasi /usr/bin/
cinnamon --replace & disown && exit
