#!/bin/bash

# Install dependencies
sudo apt-get install rofi scrot imagemagick -y

# Copy only the neccesary files
cp -r rofi-blurry-powermenu/powermenu.sh ~/.config/rofi
cp -r rofi-blurry-powermenu/powermenu_theme.rasi ~/.config/rofi
sudo cp -r rofi-blurry-powermenu/fonts/* /usr/share/fonts/

# If your using Cinnamon you'll also need:
cp -r rofi-blurry-powermenu/replace-applet.sh ~/.config/rofi
cp -r rofi-blurry-powermenu/mod-applet/applet.js ~/.config/rofi
cp -r rofi-blurry-powermenu/mod-applet/settings-schema.json ~/.config/rofi
