#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:/home/adi/.local/bin:$NPM_PACKAGES/bin"

# Preserve MANPATH if you already defined it somewhere in your config.
# Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

alias video="/home/adi/ipwebcam-gst/run-videochat.sh -i 192.168.0.100 -p 5666 -v"
alias config='/usr/bin/git --git-dir=/home/adi/.cfg/ --work-tree=/home/adi'
