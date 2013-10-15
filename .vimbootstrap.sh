#!/usr/bin/env bash
# pathogen setup
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
wget http://www.iterm2.com/hostedcolors/Solarized%20Dark.itermcolors -O \
    ~/.dotfiles/Solarized_Dark.itermcolors
