#!/bin/bash

# Install dependencies
sudo apt-get install git rofi scrot imagemagick -y

# Clone repo
mkdir -p ~/.config/rofi && cd ~/.config/rofi
git clone https://github.com/lu0/rofi-blurry-powermenu.git

# Copy only the neccesary files
cd rofi-blurry-powermenu
cp -r powermenu.sh powermenu_theme.rasi ~/.config/rofi
sudo cp -r fonts/* /usr/share/fonts/

# If your using Cinnamon you'll also need:
cd mod-applet
cp -r applet.js replace-applet.sh ~/.config/rofi

cd && rm -rf ~/.config/rofi/rofi-blurry-powermenu 