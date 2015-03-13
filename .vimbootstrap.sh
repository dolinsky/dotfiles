#!/usr/bin/env bash
# pathogen setup
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
wget http://www.iterm2.com/hostedcolors/Solarized%20Dark.itermcolors -O \
    ~/.dotfiles/Solarized_Dark.itermcolors
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-vinegar.git
# ultisnips
git clone git://github.com/SirVer/ultisnips.git
# default snippets
git clone git://github.com/honza/vim-snippets.git
#syntastic
git clone https://github.com/scrooloose/syntastic.git
# salt-vim
git clone git@github.com:saltstack/salt-vim.git
