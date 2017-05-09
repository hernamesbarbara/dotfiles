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

