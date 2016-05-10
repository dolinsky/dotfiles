#!/usr/bin/env bash
echo $(which bash)
[ -n "$PS1" ] && source ~/.bash_profile
echo $(which bash)

# added by travis gem
[ -f /Users/dolinsky/.travis/travis.sh ] && source /Users/dolinsky/.travis/travis.sh
