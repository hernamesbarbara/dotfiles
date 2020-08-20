export ZSH="/Users/hernamesbarbara/.oh-my-zsh"



echo $(setopt)
echo 

setopt GLOB_COMPLETE
setopt AUTO_CD

####################################
# HISTORY STUFF
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HIST_STAMPS="yyyy-mm-dd"
setopt EXTENDED_HISTORY
SAVEHIST=10000
HISTSIZE=10000
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

####################################
# FUNCTIONS

# put your functions in this file
fpath+=~/.zshfunctions

# then tell zsh to load each function 
# within that file into memory by default
autoload last_cmd_status
autoload github
autoload mkd
autoload lh

####################################

PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '


####################################
## COMPLETION
autoload -Uz compinit && compinit
# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# load bashcompinit for some old bash completions
# you'll need this file saved here `/usr/local/etc/bash_completion.d`
# https://github.com/Honestpuck/autopkg_complete/blob/master/autopkg
autoload bashcompinit
bashcompinit
source /usr/local/etc/bash_completion.d/*
####################################

export TERM="xterm-256color"


# ZSH_THEME="avit"
ZSH_THEME="robbyrussell"

plugins=(git zsh-z)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:~/bin"


