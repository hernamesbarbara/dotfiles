#!/usr/bin/env bash

alias ..='cd ..'
alias ..2='cd ../../'
alias h='history '

alias la='ls -lha --block-size=MB'
alias lh='ls -ld .[!.]* --block-size=MB'
alias ll='ls -lh --block-size=MB'
alias ls='ls -FN --color'
alias ls10='lst | head -n 10'
alias ls5='lst | head -n 5'
alias lsd='ls --block-size=MB -dl */'
alias lst='ls --block-size=MB -lt'

alias mv='mv -i'

alias cp='cp -i'
alias mv='mv -i'

# make a folder and cd into it.
function mkd () { mkdir -p "$@" && cd "$@"; }

alias h='history '

# count files in a directory 
# (e.g. lc ./data/*.csv counts number of csvs)
function lc() { ls -1aqf "$@" | wc -l; }
