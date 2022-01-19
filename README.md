# [clean_install]

Simple setup script for a clean Debian install.

## Manual steps

1. Install git and clone installer:
```shell
apt install git
git clone git@github.com:felipeslanza/clean_install.git
```

2. Remap Capslock to Escape (optional):
	* Tweaks -> Keyboard -> Advanced -> Second ESC


## Install

Run setup script:

```shell
./setup.sh
```

## Issues

* Shortcut `Ctrl + Shift + e` not splitting window in terminator. See [here](https://askubuntu.com/questions/1125726/how-to-disable-ctrl-shift-e-keybinding-from-showing-eeeee-and-loading-emoji-opt).
