#!/usr/bin/env bash



# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT='%F %T '
export HISTIGNORE="pwd:history"
export HISTSIZE=10000000
export HISTFILESIZE=10000000
export PROMPT_COMMAND='history -a;'
# Don't put duplicate lines in your bash history
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

