#!/usr/bin/env bash
# this is to be run after homebrew has been installed
# the following notes apply:
# ==> Caveats
# To have launchd start boot2docker at login:
#     ln -sfv /usr/local/opt/boot2docker/*.plist ~/Library/LaunchAgents
#     Then to load boot2docker now:
#         launchctl load ~/Library/LaunchAgents/homebrew.mxcl.boot2docker.plist
#
#         WARNING: launchctl will fail when run under tmux.
brew install boot2docker
