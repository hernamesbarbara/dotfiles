#!/usr/bin/env zsh
# -*- coding: utf-8 -*-

alias h="history "
alias cp="cp -i" 
alias mv="mv -i"
alias excel="open -a Microsoft\ Excel"
alias chrome="open -a Google\ Chrome"
alias brave="open -a Brave\ Browser"
alias rmpyc="find . -name '*.pyc' -type f -delete"

# Base: always color + directories first
alias ls='gls --color=auto --group-directories-first'

# Long, human-readable
alias ll='ls -lh'

# All files, including dotfiles
alias la='ls -alh'

# Sorted by time (newest first), human-readable, dirs first, colored
alias lt='ls -lht'

# Top N recent entries (keep color in the pipe)
lsn() {
  # Usage: lsn [N]; default 10
  local n="${1:-10}"
  gls -lht --group-directories-first --color=always | head -n "$n"
}


alias today='printf "$(date "+%Y-%m-%d")"'

alias utms='printf "?utm_source=medium.com&utm_medium=blog&utm_campaign=austin&utm_content="'
