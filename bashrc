#!/usr/bin/env bash

# Don't put duplicate lines in your bash history
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT='%F %T '
export HISTIGNORE="pwd:history"
export PROMPT_COMMAND='history -a;'

# Case-insensitive globbing (used in pathname expansion)
