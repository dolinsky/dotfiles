#!/usr/bin/env bash
# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin

# change the shell
if [ ! -n "$BASH" ]; then
    chsh -s /usr/local/bin/bash
fi

# load shell dotfiles:
for file in ~/.{exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
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
 
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
    . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

if [ -f `brew --prefix`/etc/bash_completion.d/tmux ]; then
    . `brew --prefix`/etc/bash_completion.d/tmux
fi

if [ -f /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
    . /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
fi

# make sure the directory has been created first
export VIRTUALENV_DISTRIBUTE=true
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
#export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/share/python/virtualenv
export WORKON_HOME="$HOME/.virtualenvs"
export PIP_VIRTUALENV_BASE="$HOME/.virtualenvs"
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
source "/usr/local/bin/virtualenvwrapper.sh"