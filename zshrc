#!/usr/bin/env zsh
# -*- coding: utf-8 -*-

export PATH="$(brew --prefix)/bin:$PATH"

export ZSH=~/.oh-my-zsh

# https://sgeb.io/posts/2016/11/til-bash-zsh-half-typed-commands/
bindkey '^q' push-line-or-edit

####################################
# HISTORY STUFF

# Larger history (allow 32³ entries vs. default 500)
export SAVEHIST=50000000;
export HISTSIZE=50000000;
export HISTFILESIZE=$HISTSIZE;


HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history;
HIST_STAMPS="yyyy-mm-dd";

# Make some commands not show up in history
export HISTCONTROL=ignoreboth;
setopt EXTENDED_HISTORY;

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

# Don't clear the screen after quitting a manual page
export MANPAGER="less -X";

# share history across multiple zsh sessions
setopt SHARE_HISTORY;
# append to history
setopt APPEND_HISTORY;
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY;
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST ;
# do not store duplications
setopt HIST_IGNORE_DUPS;
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS;
# removes blank lines from history
setopt HIST_REDUCE_BLANKS;

####################################
# FUNCTIONS

# put your functions in this file
fpath+=~/.zshfunctions

# then tell zsh to load each function 
# within that file into memory by default
autoload cwd
autoload github
autoload last_cmd_status
autoload mkd
autoload o
autoload c
autoload zmv
autoload url_clean
autoload lh

####################################

# PROMPT="%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# "
# export PS1="%10F%m%f:%11F%1~%f $ "

####################################
## COMPLETION
# autoload -Uz compinit && compinit
autoload -U compinit && compinit
# case insensitive path-completion
# zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# load bashcompinit for some old bash completions
# you'll need this file saved here `/usr/local/etc/bash_completion.d`
# https://github.com/Honestpuck/autopkg_complete/blob/master/autopkg
# autoload bashcompinit
# bashcompinit
# source /usr/local/etc/bash_completion.d/*
####################################

export TERM="xterm-256color"


# ZSH_THEME="avit"
ZSH_THEME="robbyrussell"

plugins=(git z jsontools isodate)

zstyle ':completion:*' menu select

source $ZSH/oh-my-zsh.sh

# source /usr/local/etc/bash_completion.d/*

# export PATH="$PATH:/usr/local/lib/ruby/gems/2.7.0/bin"
export PATH="$PATH:$(brew --prefix)/opt/ruby/bin"
export PATH="$PATH:$(brew --prefix)/lib/ruby/gems/3.2.0/bin"


export PATH="$PATH:$(brew --prefix)/opt/python3/libexec/bin"

export PATH="$PATH:$(which python3)"

export PATH="$PATH":~/bin


if [[ -x ~/.greetoftheday ]]; then
     ~/.greetoftheday
fi

source ~/.aliases.zsh
