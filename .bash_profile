#!/usr/bin/env bash
# Set architecture flags
export ARCHFLAGS="-arch x86_64"
#case "$-" in *i*) if [ -f ~/.bashrc ]; then . ~/.bashrc; fi;; esac
export LESSOPEN="|/usr/local/bin/lesspipe.sh %s" LESS_ADVANCED_PREPROCESSOR=1
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# 9/24/2018 replace rvm with rbenv
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$HOME/.rbenv/shims:${PATH}"
eval "$(rbenv init -)"
