#!/bin/bash

# sourcing several other miscellaneous configs I like
source ~/.miscrc

: '
*****************************************************************************
***********************************<$PATH>***********************************
*****************************************************************************
'

PATH=$PATH:/usr/local/bin        # homebrew first
PATH=$PATH:$HOME/.rvm/bin        # Add RVM to PATH for scripting 
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/local/lib
PATH=$PATH:$HOME/bin

# add julia
PATH=$PATH:/Applications/Julia-0.2.1.app/Contents/Resources/julia/bin

# add MacTex LaTeX distribution (requried for Octave)
PATH=$PATH:/usr/texbin

# add scripts to path to be able to use them from anywhere on your mac
PATH=$PATH:~/dotfiles/scripts/bin

# helper for installing 3rd party libraries for us in Alfred.app workflows
export ALFREDPATH=~/Library/Application\ Support/Alfred\ 2/Alfred.alfredpreferences/workflows/

# virtualenv's default python interpreter when creating new envs
export PYTHON_EXE=$(which python)

# go path enables you to use `go get`
export GOPATH=$HOME/.go
PATH=$PATH:$GOPATH/bin

# add node to path
PATH=$PATH:/usr/local/share/npm/bin

export PATH=$PATH

: '
******************************************************************************
*********************************</$PATH>*************************************
******************************************************************************
'

# rvm shit
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# source aliases
source ~/.aliases

# source .bash_prompt
source ~/.bash_prompt

source ~/greetoftheday
