#!/usr/bin/env zsh
# -*- coding: utf-8 -*-

alias h="history "
alias ll='ls -lh'
alias cp="cp -i"   # interactive copy / prompt before overwriting
alias mv="mv -i"   # interactive move / prompt before overwriting
alias excel="open -a Microsoft\ Excel"
alias chrome="open -a Google\ Chrome"
alias rmpyc="find . -name '*.pyc' -type f -delete"
alias ccat="pygmentize -O style=solarized-dark -f console256 -g"

alias today='printf "$(date "+%Y-%m-%d")"'