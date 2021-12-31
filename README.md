# [clean_install]

Scripts, config files and instructions for a clean Debian install

## Unscriptable steps

Install git and clone installer:
````shell
su
apt install git
cd ~ && mkdir code && cd code
git clone git@github.com:felipeslanza/clean_install.git
````

Remap CAPSLOCK -> ESC (optional):
	- go to: Tweaks -> Keyboard -> Advanced -> Second ESC


## Install

Run install script and add config files to user's home:

````shell
sudo chmod +x setup.sh
./setup.sh
````

## Issues

Shortcut `Ctrl + Shift + e` not splitting window in terminator. See https://askubuntu.com/questions/1125726/how-to-disable-ctrl-shift-e-keybinding-from-showing-eeeee-and-loading-emoji-opti.






