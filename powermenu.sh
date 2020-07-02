#!/bin/bash

#
# Powermenu for Rofi
# 
# Author : Lucero Alvarado
# Github : @lu0
#

# Blur desktop screenshot to use as a fake background
SS_PATH="$HOME/.config/rofi/screenshot.png"
import -window root $SS_PATH && convert $SS_PATH -blur 0x10 -auto-level +depth $SS_PATH

# Options as characters
# Copied from decoded unicodes.
# (Private use of "Feather" font)
shutdown="";        # "\uE9C0"
reboot="";          # "\uE9C4"
sleep="";           # "\uE9A3"
logout="";          # "\uE991"
lock="";            # "\uE98F"

options="$shutdown\n$reboot\n$sleep\n$logout\n$lock"

selected="$(echo -e "$options" | 
            rofi -show-icons -theme fullscreen_powermenu.rasi \
                 -fake-background $SS_PATH -fake-transparency \
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
