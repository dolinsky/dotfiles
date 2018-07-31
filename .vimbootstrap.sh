#!/usr/bin/env bash
# pathogen setup
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/ftplugin && \
curl -LSso ~/.vim/autoload/pathogen.vim \
    https://tpo.pe/pathogen.vim
#wget http://www.iterm2.com/hostedcolors/Solarized%20Dark.itermcolors -O \
#    ~/dotfiles/Solarized_Dark.itermcolors
cd ~/.vim/bundle
# vim-solarized
git clone git://github.com/altercation/vim-colors-solarized.git
git clone git://github.com/tpope/vim-vinegar.git
# ultisnips
git clone git://github.com/SirVer/ultisnips.git
# default snippets
git clone git://github.com/honza/vim-snippets.git
#syntastic
git clone https://github.com/scrooloose/syntastic.git
# salt-vim
git clone git@github.com:saltstack/salt-vim.git
# tagbar
git clone https://github.com/majutsushi/tagbar
# tcomment_vim
git clone https://github.com/tomtom/tcomment_vim.git
# vim-puppet
git clone https://github.com/rodjek/vim-puppet
# vim-json
git clone https://github.com/elzr/vim-json.git
# ctrlp
git clone https://github.com/ctrlpvim/ctrlp.vim.git

cd ~/.vim/ftplugin
ln -s ~/dotfiles/.vim/ftplugin/json.vim ./json.vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
