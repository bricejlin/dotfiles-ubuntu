#!/usr/bin/env bash

set -e

# Install essentials
apt update -y
apt full-upgrade -y

apt install -y git vim zsh

#git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh

# Set zsh as default shell
chsh -s $(which zsh)

function doIt() {
  rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "init" --exclude "README.md" --exclude "LICENSE-MIT.txt" -av --no-perms . ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
  doIt
  fi
fi

unset doIt
