#!/usr/bin/env zsh
# -*- coding: utf-8 -*-

export PATH="/opt/homebrew/bin:$PATH"

export ZSH=~/.oh-my-zsh

# Keybindings
bindkey '^q' push-line-or-edit

####################################
# HISTORY SETTINGS
export SAVEHIST=500000
export HISTSIZE=500000
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HIST_STAMPS="yyyy-mm-dd"

setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_REDUCE_BLANKS

####################################
# LOCALE SETTINGS
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"

####################################
# FUNCTIONS
fpath=(~/.zshfunctions ~/.zsh/completions $fpath)

autoload -Uz cwd github last_cmd_status mkd o c zmv url_clean url_humanize lh lsd wifi_qr_code ebookify cleanup ccat g_ignore

source ~/.config/zsh/set_pycache_prefix.zsh

####################################
# COMPLETION
autoload -U compinit

# Define the zcompdump file path
ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump"

# Use cached completions if available
if [[ -f $ZSH_COMPDUMP.zwc ]]; then
  compinit -C
else
  compinit
  zcompile $ZSH_COMPDUMP.zwc
fi

####################################
# ZSH SETTINGS
export TERM="xterm-256color"
ZSH_THEME="robbyrussell"
plugins=(git z jsontools isodate)

zstyle ':completion:*' menu select
source $ZSH/oh-my-zsh.sh

####################################
# PATH SETTINGS
export PATH="$HOME/Library/Python/3.11/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"
export PATH="$(brew --prefix)/opt/ruby/bin:$PATH"
export PATH="$(brew --prefix)/lib/ruby/gems/3.2.0/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

[ -f ~/.env_private ] && source ~/.env_private

if [[ -x ~/.greetoftheday ]]; then
  ~/.greetoftheday
fi

source ~/.aliases.zsh
