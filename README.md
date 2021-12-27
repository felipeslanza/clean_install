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


## Run install script

````shell
./install.sh
````

## Copy config files
````shell
mv .zshrc .vimrc ~
````









