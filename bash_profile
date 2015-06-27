#!/bin/bash

# sourcing several other miscellaneous configs I like
source ~/.miscrc

# Add Homebrew `/usr/local/bin` and User `~/bin` to the `$PATH`
PATH=/usr/local/lib:$PATH
PATH=/usr/local/bin:$PATH

# add the bin folder in your home directory to your path
PATH=~/bin:$PATH

# export the PATH variable
PATH=/usr/local/sbin:$PATH
# add julia
PATH=$PATH:/Applications/Julia-0.2.1.app/Contents/Resources/julia/bin

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin 

# add MacTex LaTeX distribution (requried for Octave)
PATH=$PATH:/usr/texbin

# add scripts to path to be able to use them from anywhere on your mac
PATH=$PATH:~/dotfiles/scripts

# windml python package
export PYTHONPATH=$PYTHONPATH:~/windml

# go path enables you to use `go get`
export GOPATH=$HOME/.go
PATH=$PATH:$GOPATH/bin

# add node to path
PATH=$PATH:/usr/local/share/npm/bin

export PATH=$PATH

# rvm shit
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# source aliases
source ~/.aliases

# source .bash_prompt
source ~/.bash_prompt

source ~/greetoftheday
