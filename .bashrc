#!/usr/bin/env bash
# load shell dotfiles:
for file in ~/.{env.locals,exports,aliases,functions,extra}; do
    [ -e "$file" ] && [ -r "$file" ] && source "$file"
done
unset file

# Set architecture flags
export ARCHFLAGS="-arch x86_64"
export PATH="/usr/local/opt/python/libexec/bin:/usr/local/opt/openssl@1.1/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"

# Append to bash history
shopt -s histappend
shopt -s cmdhist

# autocorrect typos in path names
shopt -s cdspell

# enable bash 4 features, fail silently
for option in autocd extglob globstar; do
    shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for SSH hostnames
#[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh
 
# pyenv
#if [ -f "$HOME/.dotfiles/.pyenvrc" ]; then
#    . "$HOME/.dotfiles/.pyenvrc"
#fi

# enable bash 4 autocomplete via brew bash-completion@2
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
#if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
#    source "$(brew --prefix)/share/bash-completion/bash_completion";
#fi;

#source "$(brew --prefix)"/etc/bash_completion
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

# powerline
# fonts - https://github.com/powerline/fonts
# changed to python3.6 3/12/18
# changed to python3.7 9/24/18
# changed to python3.9 1/23/21
if [ -f /usr/local/lib/python3.9/site-packages/powerline/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    export POWERLINE_CONFIG_COMMAND="/usr/local/bin/powerline-config"
    export POWERLINE_COMMAND=powerline
    . /usr/local/lib/python3.9/site-packages/powerline/bindings/bash/powerline.sh
fi
#if [ -f ~/bin/tmuxinator.sh ]; then
#    . ~/bin/tmuxinator.sh
#fi


# make sure the directory has been created first
#export VIRTUALENV_DISTRIBUTE=true
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2
#export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
#export WORKON_HOME="$HOME/.virtualenvs"
#export PIP_VIRTUALENV_BASE="$HOME/.virtualenvs"
#export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache
#source "/usr/local/bin/virtualenvwrapper.sh"
#
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Ensure user-installed binaries take precedence
# don't export from inside tmux
# 2/8/18 - undid this conditional to help troubleshoot wrong PATH order from inside tmux
# 2/14/18 - prepended python/libexec due to homebrew update https://github.com/Homebrew/homebrew-core/issues/15746
#if [[ -z $TMUX ]]; then
#    source "$HOME/perl5/perlbrew/etc/bashrc"
#    export PATH="/usr/local/opt/python/libexec/bin:/usr/local/opt/openssl@1.1/bin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH"
#fi

# added by travis gem
[ -f /Users/dolinsky/.travis/travis.sh ] && source /Users/dolinsky/.travis/travis.sh

# clean up duplicate PATH entries
export PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
