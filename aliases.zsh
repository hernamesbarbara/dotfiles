#!/usr/bin/env zsh
# -*- coding: utf-8 -*-

alias h="history "
alias cp="cp -i" 
alias mv="mv -i"
alias excel="open -a Microsoft\ Excel"
alias chrome="open -a Google\ Chrome"
alias brave="open -a Brave\ Browser"
alias rmpyc="find . -name '*.pyc' -type f -delete"

# ls aliases now use the ls function in ~/.zshfunctions/ls
# ll, la, lt are convenience shortcuts
alias ll='ls -lh'
alias la='ls -alh'
alias lt='ls -lht'


alias today='printf "$(date "+%Y-%m-%d")"'

alias utms='printf "?utm_source=medium.com&utm_medium=blog&utm_campaign=austin&utm_content="'
