#!/usr/bin/sh

SCRIPT=$(readlink -f "$0")
SCRIPT_PATH=$(dirname "$SCRIPT")

cd ~
su

# ++++++++++++++++++
# Installation setup
# ++++++++++++++++++
echo "---> Installing dependencies and setting up repos"

# Script dependencies
apt install -y curl wget make git vim gnupg2 xclip

# Custom repos
add-apt-repository ppa:deadsnakes/ppa  # python versions
add-apt-repository ppa:mattrose/terminator

# MongoDB (https://docs.mongodb.com/manual/tutorial/install-mongodb-on-debian/)
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list


# ++++++++++++++++
# Install packages
# ++++++++++++++++
echo "---> Installing main packages"

# Update and install all `apt` packages
apt update -y && apt upgrade -y
apt install -y openssl libssl-dev ctags vim-gtk3 rsync build-essential xdotool
apt install -y python3.7-dev python3.9-dev  # Add/change versions as desired
apt install -y sqlite3 terminator mongodb-org

# Install Oh-my-zsh (https://ohmyz.sh/#install)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instal Node Version Manager (https://github.com/nvm-sh/nvm)
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash


# ++++++++++++++++
# Automated config
# ++++++++++++++++

# Increase typing speed
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
gsettings set org.gnome.desktop.peripherals.keyboard delay 250

# Expose config files to user
echo "---> Installing config files and resetting shell"
cp $SCRIPT_PATH/.zshrc ~
cp $SCRIPT_PATH/.vimrc ~
exec $SHELL

echo "---> Finished setup"
