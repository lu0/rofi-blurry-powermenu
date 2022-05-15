#!/usr/bin/env bash

#
# Powermenu made with Rofi
# 
# https://github.com/lu0
# 

# Options as characters
# Copied from decoded unicodes (private use of "Feather" font)
shutdown="";        # "\uE9C0"
reboot="";          # "\uE9C4"
sleep="";           # "\uE9A3"
logout="";          # "\uE991"
lock="";            # "\uE98F"
options="$shutdown\n$reboot\n$sleep\n$logout\n$lock"

# Get dimensions of the current display by using module `display_info`
script_abs_file_path=$(readlink -f "$(which "${BASH_SOURCE[0]}")")
script_abs_dir_path=$(dirname "${script_abs_file_path}")
source "${script_abs_dir_path}/current-x-display-info/display_info.sh"

display_info::load

x="${DISPLAY_INFO[x]}"
y="${DISPLAY_INFO[y]}"
width=${DISPLAY_INFO["width"]}
height="${DISPLAY_INFO[height]}"

# Fake blurred background
SS_PATH="$HOME/.config/rofi/screenshot"
rm -f "${SS_PATH}.jpg"
scrot -a $x,$y,$width,$height "${SS_PATH}.jpg"                 # screenshot
convert "${SS_PATH}.jpg" -blur 0x10 -auto-level "${SS_PATH}.jpg"    # blur
convert "${SS_PATH}.jpg" "${SS_PATH}.png"                           # rofi reads png images

# Compute font size based on display dimensions
DEFAULT_WIDTH=1920
DEFAULT_FONTSIZE=60
FONTSIZE=$(echo "$width*$DEFAULT_FONTSIZE/$DEFAULT_WIDTH" | bc)


while getopts "lp" OPT; do
    case "$OPT" in
        p) PRESELECTION=0 ;;
        l) PRESELECTION=3 ;;
        *) PRESELECTION=4 ;;
    esac
done
if (( $OPTIND == 1 )); then
   PRESELECTION=4
fi

selected="$(echo -e "$options" | 
            rofi -show-icons -theme powermenu_theme.rasi \
                 -fake-background ${SS_PATH}.png -fake-transparency \
                 -font "WeblySleek UI Light, $FONTSIZE" \
                 -p "See you later, ${LOGNAME^}!" -dmenu -selected-row ${PRESELECTION})"

case $selected in

    $shutdown)
        systemctl poweroff
        ;;

    $reboot)
        systemctl reboot
        ;;

    $sleep)
        systemctl suspend
        ;;

    $logout)
        cinnamon-session-quit --logout --no-prompt || ( xfce4-session-logout --logout || mate-session-save --logout )
        ;;

    $lock)
        cinnamon-screensaver-command --lock || ( xflock4 || mate-screensaver-command -l )
        ;;

esac
