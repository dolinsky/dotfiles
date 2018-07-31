#!/usr/bin/env/bash

# install powerline - after brew python and brew vim
pip install -U powerline-status
# https://github.com/jaspernbrouwer/powerline-gitstatus
pip install -U powerline-gitstatus

mkdir -p ~/.dotfiles/.config/powerline
ln -s ~/.dotfiles/.config ~/.config
cp -R /usr/local/lib/python2.7/site-packages/powerline/config_files/* ~/.dotfiles/.config/powerline
