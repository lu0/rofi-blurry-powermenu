# Blurry Fullscreen Powermenu for Rofi

![Preview while on desktop](preview.png)
![Preview while busy](preview_busy.png)

A simple yet beautiful powermenu for [Rofi](https://github.com/davatorium/rofi), includes a "fake" blur effect to the current screen as some Desktop Environments don't support native blur.

## Installation
```zsh

# Install dependencies
sudo apt-get install rofi
sudo apt-get install imagemagick

# Clone this repo
mkdir -p ~/.config/rofi && cd ~/.config/rofi
git clone https://github.com/lu0/rofi-blurry-powermenu.git

# Copy only the neccesary files
cd rofi-blurry-powermenu
cp -r powermenu.sh fullscreen_powermenu.rasi ~/.config/rofi
sudo cp -r fonts/* /usr/share/fonts/
cd && rm -rf ~/.config/rofi-blurry-powermenu 
```

## Usage
Run the script or assign it to a keybinding.
```zsh
~/.config/rofi/powermenu.sh
```

## Notes
Tested under Linux Mint Cinnamon, specific commands to lock the screen, suspend and logout may change according to your system.
Tested under Rofi 1.5.4 and ImageMagick 8:6.9.10.23 :)
