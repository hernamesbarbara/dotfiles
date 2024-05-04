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
autoload url_humanize
autoload lh
autoload wifi_qr_code
autoload ebookify
autoload cleanup

####################################
source ~/.config/zsh/set_pycache_prefix.zsh
####################################
## COMPLETION
# autoload -Uz compinit && compinit
autoload -U compinit && compinit
####################################

export TERM="xterm-256color"

# ZSH_THEME="avit"
ZSH_THEME="robbyrussell"

plugins=(git z jsontools isodate)

zstyle ':completion:*' menu select

source $ZSH/oh-my-zsh.sh

# source /usr/local/etc/bash_completion.d/*

# export PATH="$PATH:/usr/local/lib/ruby/gems/2.7.0/bin"

export PATH="/opt/homebrew/bin:$PATH"

export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="$HOME/Library/Python/3.11/bin:$PATH"

export PATH="$PATH:$(brew --prefix)/opt/ruby/bin"
export PATH="$PATH:$(brew --prefix)/lib/ruby/gems/3.2.0/bin"

export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"


export PATH="$PATH":~/bin

# export PATH="${PATH}:$(brew --prefix)/opt/postgresql@15/bin"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

[ -f ~/.env_private ] && source ~/.env_private


if [[ -x ~/.greetoftheday ]]; then
     ~/.greetoftheday
fi

source ~/.aliases.zsh

# Created by `pipx` on 2024-03-06 19:58:06
export PATH="$PATH:/Users/hernamesbarbara/.local/bin"
