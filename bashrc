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
export HOMEBREW_NO_ANALYTICS=1


export PATH=$HOMEBREW_PREFIX:$PATH
export PATH=$HOMEBREW_PREFIX/bin:$PATH
export PATH=$HOMEBREW_PREFIX/sbin:$PATH
export PATH=$PATH:$HOME/.rvm/bin        # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/sbin

if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export MANPATH=$(brew --prefix coreutils)/libexec/gnuman:$MANPATH
export MANPATH=/usr/share/man:$MANPATH

# add julia
export PATH=$PATH:/Applications/Julia-0.2.1.app/Contents/Resources/julia/bin

# add MacTex LaTeX distribution (requried for Octave)
export PATH=$PATH:/usr/texbin

# add scripts to path to be able to use them from anywhere on your mac
export PATH=$PATH:$HOME/scripts/bin

export PATH=$PATH:"/usr/X11/bin"

complete -C '/usr/local/bin/aws_completer' aws
export PATH=$HOMEBREW_PREFIX/aws/bin:$PATH
export PATH="/usr/local/opt/qt/bin:$PATH"

# export MAGICK_HOME="$(brew --prefix)/Cellar/imagemagick/$(brew info imagemagick --json | jq -r .[0].versions.stable)"
# export PATH="$MAGICK_HOME/bin:$PATH"

# helper for installing 3rd party libraries for us in Alfred.app workflows
export ALFREDPATH=~/Library/Application\ Support/Alfred\ 2/Alfred.alfredpreferences/workflows/


export BROWSER=/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome

: '
******************************************************************************
*********************************</$PATH>*************************************
******************************************************************************
'

# rvm shit
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# export PGHOST=localhost
# export PGDATA=/usr/local/var/postgres

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export PATH=$PATH

# use sublime text as editor
if [[ -x "$(which code)" ]]; then
     export EDITOR="$(which code)"
fi



# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/hernamesbarbara/.lmstudio/bin"
# End of LM Studio CLI section

