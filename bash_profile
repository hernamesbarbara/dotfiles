#!/usr/bin/env bash
# -*- coding: utf-8 -*- 
# ~/.bash_profile

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

for file in ~/.{bashrc,bash_prompt,privaterc,aliases,bash_aliases,zrc,gitaliases}; do
    [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done

##
# Your previous /Users/hernamesbarbara/.bash_profile file was backed up as /Users/hernamesbarbara/.bash_profile.macports-saved_2019-03-05_at_09:43:16
##

# MacPorts Installer addition on 2019-03-05_at_09:43:16: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2019-03-05_at_09:43:16: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.


# this is hardcoded with the ruby version 
# installed with rbenv
# export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH
eval "$(rbenv init -)"
# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/hernamesbarbara/.lmstudio/bin"
# End of LM Studio CLI section

