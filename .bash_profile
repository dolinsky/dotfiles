#!/usr/bin/env bash
echo '.bash_profile'
echo $(which bash)
# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH

# change the shell
if [ ! -n "$BASH" ]; then
    chsh -s /usr/local/bin/bash
fi

# load shell dotfiles:
for file in ~/.{exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Append to bash history
shopt -s histappend

# autocorrect typos in path names
shopt -s cdspell

shopt -s cmdhist
shopt -s extglob
shopt -s globstar

# Add tab completion for SSH hostnames
#[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh
 
# pyenv
#if [ -f "$HOME/.dotfiles/.pyenvrc" ]; then
#    . "$HOME/.dotfiles/.pyenvrc"
#fi

source "$(brew --prefix)"/etc/bash_completion
#if [ -f `brew --prefix`/etc/bash_completion ]; then
#  . `brew --prefix`/etc/bash_completion
#fi
#
#if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
#    . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
#fi
#
#if [ -f `brew --prefix`/etc/bash_completion.d/tmux ]; then
#    . `brew --prefix`/etc/bash_completion.d/tmux
#fi
#
#if [ -f `brew --prefix`/etc/bash_completion.d/docker ]; then
#    . `brew --prefix`/etc/bash_completion.d/docker
#fi
#
#if [ -f `brew --prefix`/etc/bash_completion.d/docker-compose ]; then
#    . `brew --prefix`/etc/bash_completion.d/docker-compose
#fi
#
#if [ -f `brew --prefix`/etc/bash_completion.d/scala ]; then
#    . `brew --prefix`/etc/bash_completion.d/scala
#fi
# setting due to brew meld install
#export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

if [ -f /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    . /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi

if [ -f ~/bin/tmuxinator.sh ]; then
    . ~/bin/tmuxinator.sh
fi


# make sure the directory has been created first
export VIRTUALENV_DISTRIBUTE=true
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export WORKON_HOME="$HOME/.virtualenvs"
export PIP_VIRTUALENV_BASE="$HOME/.virtualenvs"
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
source "/usr/local/bin/virtualenvwrapper.sh"

source "$HOME/perl5/perlbrew/etc/bashrc"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
