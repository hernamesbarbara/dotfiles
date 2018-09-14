#!/usr/bin/env bash

alias ~='cd ~'
alias ..='cd ..'
alias ..2='cd ../../'
alias h='history '

alias ls="ls ${colorflag}"
alias la='ls -lha --block-size=MB'
alias lh='ls -ld .[!.]* --block-size=MB'
alias ll='ls -lh --block-size=MB'
alias ls='ls -FN --color'
alias ls10='lst | head -n 10'
alias ls5='lst | head -n 5'
alias lsd='ls --block-size=MB -dl */'    # List only directories
alias lst='ls --block-size=MB -lt'       # order by modified desc

function lh() { ls -ld .?*  --block-size=MB "$@"; }    # list hidden files only


alias cp='cp -i'   # interactive copy / prompt before overwriting
alias mv='mv -i'   # interactive move / prompt before overwriting

# make a folder and cd into it.
function mkd () { mkdir -p "$@" && cd "$@"; }

alias h='history '

# count files in a directory 
# (e.g. lc ./data/*.csv counts number of csvs)
function lc() { ls -1aqf "$@" | wc -l; }

function o() {
    if [[ -z "$@" ]]; then
        open .
    else
        open "$1"
    fi
}

# cat with syntax highlighting (requires pygments which should be installed by default)
alias ccat='pygmentize -O style=solarizeddark -f console256 -g'

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"