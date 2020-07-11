#!/bin/bash

# Replace applet files with the the modified ones
cp -rf applet.js settings-scheme.json /usr/share/cinnamon/applets/menu@cinnamon.org/

# Copy rofi files
mkdir -p /usr/bin/
cp -r powermenu.sh powermenu_theme.rasi /usr/bin/

# Restart the menu applet
# From: gist.github.com/hyOzd/35e913db620b3ba086fb
dbus-send --session --dest=org.Cinnamon.LookingGlass --type=method_call /org/Cinnamon/LookingGlass org.Cinnamon.LookingGlass.ReloadExtension string:'menu@cinnamon.org' string:'APPLET'
