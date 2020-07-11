#!/bin/bash

# Install dependencies
sudo apt-get install rofi scrot imagemagick -y

# Copy only the neccesary files
cd rofi-blurry-powermenu
cp -r powermenu.sh powermenu_theme.rasi ~/.config/rofi
sudo cp -r fonts/* /usr/share/fonts/

# If your using Cinnamon you'll also need:
cd mod-applet
cp -r applet.js replace-applet.sh ~/.config/rofi
