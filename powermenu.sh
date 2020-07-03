#!/bin/bash

#
# Powermenu for Rofi
# 
# Author : Lucero Alvarado
# Github : @lu0
#

# Options as characters
# Copied from decoded unicodes.
# (Private use of "Feather" font)
shutdown="";        # "\uE9C0"
reboot="";          # "\uE9C4"
sleep="";           # "\uE9A3"
logout="";          # "\uE991"
lock="";            # "\uE98F"

options="$shutdown\n$reboot\n$sleep\n$logout\n$lock"

# Blur desktop screenshot to use as a fake background
SS_PATH="$HOME/.config/rofi/screenshot.png"
import -window root $SS_PATH && convert $SS_PATH -blur 0x10 -auto-level +depth $SS_PATH

# Font size according to screen dimensions
DEFAULT_FONTSIZE=60
DEFAULT_WIDTH=1920
CURRENT_WIDTH=$(xdpyinfo | awk -F'[ x]+' '/dimensions:/{print $3}')
FONTSIZE=$(echo "$CURRENT_WIDTH/$DEFAULT_WIDTH*$DEFAULT_FONTSIZE" | bc -l)

selected="$(echo -e "$options" | 
            rofi -show-icons -theme fullscreen_powermenu.rasi \
                 -fake-background $SS_PATH -fake-transparency \
                 -font "WeblySleek UI Normal $FONTSIZE" \
                 -p "See you later, ${LOGNAME^}!" -dmenu -selected-row 4)"

case $selected in

    $shutdown)
        shutdown -P now
        ;;

    $reboot)
        reboot
        ;;

    $sleep)
        systemctl suspend
        ;;

    $logout)
        gnome-session-quit --no-prompt
        ;;

    $lock)
        cinnamon-screensaver-command --lock
        ;;

esac
