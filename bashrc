#!/usr/bin/env bash

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

export HISTFILE=~/.bash_history
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT='%F %T '
export HISTSIZE=10000
export HISTFILESIZE=10000
export PROMPT_COMMAND='history -a;'

# Don't put duplicate lines in your bash history
shopt -s nocaseglob;
export HISTCONTROL=ignoreboth:erasedups


# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

: '
*****************************************************************************
***********************************<$PATH>***********************************
*****************************************************************************
'
export HOMEBREW_PREFIX=$(brew --prefix)

PATH=$HOMEBREW_PREFIX:$PATH
PATH=$HOMEBREW_PREFIX/bin:$PATH
PATH=$HOMEBREW_PREFIX/sbin:$PATH
PATH=$PATH:$HOME/.rvm/bin        # Add RVM to PATH for scripting 
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/sbin

if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export MANPATH=$(brew --prefix coreutils)/libexec/gnuman:$MANPATH

# add julia
PATH=$PATH:/Applications/Julia-0.2.1.app/Contents/Resources/julia/bin

# add MacTex LaTeX distribution (requried for Octave)
PATH=$PATH:/usr/texbin

# add scripts to path to be able to use them from anywhere on your mac
PATH=$PATH:$HOME/dotfiles/scripts/bin

# go path enables you to use `go get`
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

complete -C '/usr/local/bin/aws_completer' aws
export PATH=$HOMEBREW_PREFIX/aws/bin:$PATH
export PATH="/usr/local/opt/qt/bin:$PATH"

# helper for installing 3rd party libraries for us in Alfred.app workflows
export ALFREDPATH=~/Library/Application\ Support/Alfred\ 2/Alfred.alfredpreferences/workflows/

# virtualenv's default python interpreter when creating new envs
export PYTHON_EXE=$(which python)

export BROWSER=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome

: '
******************************************************************************
*********************************</$PATH>*************************************
******************************************************************************
'
# rvm shit
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PGHOST=localhost
export PGDATA=/usr/local/var/postgres

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [[ -x "$(which thefuck)" ]]; then 
     eval "$(thefuck --alias)"
fi

source ~/greetoftheday
export PATH=$PATH
