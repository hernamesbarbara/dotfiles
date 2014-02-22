#!/bin/bash
# export TERM=xterm-color
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export LSCOLORS=Exfxcxdxbxegedabagacad
# export LSCOLORS=gxfxcxdxbxegedabagacad # Dark lscolor scheme
# Don't put duplicate lines in your bash history
export HISTCONTROL=ignoredups
# increase history limit (100KB or 5K entries)
export HISTFILESIZE=100000
export HISTSIZE=5000

# Readline, the line editing library that bash uses, does not know
# that the terminal escape sequences do not take up space on the
# screen. The redisplay code assumes, unless told otherwise, that
# each character in the prompt is a `printable' character that
# takes up one character position on the screen. 

# You can use the bash prompt expansion facility (see the PROMPTING
# section in the manual page) to tell readline that sequences of
# characters in the prompt strings take up no screen space. 

# Use the \[ escape to begin a sequence of non-printing characters,
# and the \] escape to signal the end of such a sequence.
# Define some colors first:
RED='\[\e[1;31m\]'
BOLDYELLOW='\[\e[1;33m\]'
GREEN='\[\e[0;32m\]'
BLUE='\[\e[1;34m\]'
DARKBROWN='\[\e[1;33m\]'
DARKGRAY='\[\e[1;30m\]'
CUSTOMCOLORMIX='\[\e[1;30m\]'
DARKCUSTOMCOLORMIX='\[\e[1;32m\]'
LIGHTBLUE="\[\033[1;36m\]"
PURPLE='\[\e[1;35m\]' #git branch
# EG: GREEN="\[\e[0;32m\]" 
# PURPLE='\[\e[1;35m\]'
# BLUE='\[\e[1;34m\]'
NC='\[\e[0m\]' # No Color
# PS1="\[\033[1;34;40m[\033[1;31;40m\u@\h:\w\033[1;34;40m]\033[1;37;40m $\033[0;37;0m\] "
# PS1="${CUSTOMCOLORMIX}\\u@\h: \\W]\\$ ${NC}"
EVERGREEN_TREE=(`echo -e "\xf0\x9f\x8c\xb2"`)
PALM_TREE=(`echo -e "\xF0\x9F\x8C\xB4"`)
# PS1 (shell prompt)
# set variable identifying the chroot you work in (used in the prompt below)
# if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
# fi

# function parse_git_dirty {
#   git diff --quiet HEAD &>/dev/null
#   [[ $? == 1 ]] && echo "⚡"
# }

# function parse_git_branch {
#   local branch=$(__git_ps1 "%s")
#   [[ $branch ]] && echo "[$branch$(parse_git_dirty)]"
# }

# PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\$(parse_git_branch)\[\033[00m\]\$"
# PS1="${DARKCUSTOMCOLORMIX}\\u@\h:\\W]${PURPLE}\$(parse_git_branch)${DARKCUSTOMCOLORMIX}$ ${NC}"
PS1="${LIGHTBLUE}\\u ${BOLDYELLOW}[\\W] ${PURPLE}\$(parse_git_branch) ${DARKCUSTOMCOLORMIX}$ ${NC}"


list_detailed_more()
{
	ls -lah $1 | more
}

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export -f parse_git_branch


function github() {
  #call from a local repo to open the repository on github in browser
  giturl=$(git config --get remote.origin.url)
  if [ "$giturl" == "" ]
    then
     echo "Not a git repository or no remote.origin.url set"
     exit 1;
  fi
  giturl=${giturl/git\@github\.com\:/https://github.com/}
  giturl=${giturl/\.git//}
  echo $giturl
  open $giturl
}


# bash git completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

###############################
##         Aliases           ##
###############################

###################
###### osx ########
###################

alias reload='source ~/.bash_profile && source ~/.bashrc'
alias versions="python --version && ruby -v && rails -v && node --version && mongo --version && postgres --version"
alias ls='ls -hp'
alias ll='ls -lt && pwd'
alias la='ls -la'
alias lt='ls -lt' #list files by created date desc
alias l='ls -CF'
alias cll="clear; ls -lAh"
alias clt="clear; ls -lt"
alias c='clear'
alias cl='clear; ll'
alias ..="cd .."
alias ..2="cd ../../"
alias ..3="cd ../../../"
alias back='cd -'
alias ~='cd ~'
alias o='open'
alias bp='subl ~/.bash_profile'
alias trash='safe_rm'
# alias grep='grep -H -n'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cwd='pwd | tr -d "\r\n" | pbcopy' #copy working directory
alias cwdt="pwd | sed -e 's/\/Users\/austinogilvie/~/g' | tr -d '\r\n' | pbcopy" # copy working dir but replace /Users/austin with ~/
alias where="pwd"
alias h='history'
alias ppath="echo $PATH | tr ':' '\n'" #print path
alias rtags="find . -name '*.rb' | xargs /usr/bin/ctags -R -a -f TAGS"
alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias untar='tar xvfz'
alias today='echo $(date) && say -r 220 $(date "+%B %d, %Y")'
###################
## applications ##
###################
alias chrome="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias excel="open -a Microsoft\ Excel"
# alias mongod="mongod --dbpath ~/data/db"
# alias naics="echo 'mongodb://austinogilvie:4rfv5tgb@ds039037.mongolab.com:39037/industries'"
# alias start_postgres="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
# alias stop_postgres="pg_ctl -D /usr/local/var/postgres stop -s -m fast"


###################
##    Node.js    ##
###################
alias mochac='mocha --compilers coffee:coffee-script'


##################
## Repositories ##
##################
alias workspace='cd ~/Workspace/ && ls -la'
alias repos='cd ~/Workspace/Repositories/ && pwd'
alias blog='cd ~/Workspace/Repositories/hernamesbarbara-blog'
alias court='cd ~/Workspace/Repositories/CourtStreet/ && ls -la'
alias yh='cd ~/Workspace/yhathq-repos/ && pwd'
# alias pgaly='psql -h ec2-107-22-89-142.compute-1.amazonaws.com -d anecdote_app -U app'
alias yhdb='mongo vincent.mongohq.com:10003/yhat -u webapp -p382court'
alias yhdw='psql -h dw.yhathq.com -d yhat -U austin'
alias sitrep='/Users/austinogilvie/Workspace/yhathq/analytics/sitrep.sh'
alias txt2snake='/Users/austinogilvie/Workspace/Repositories/txt2snake/txt2snake'
# alias table2csv='python /Users/austinogilvie/Workspace/Repositories/opensource/table2csv/table2csv/table2csv.py'
alias href='/Users/austinogilvie/Workspace/yhathq/blog/tmp/href'
alias refresh_db='/Users/austinogilvie/Workspace/yhathq/analytics/google_analytics/run_ga.sh'
alias yhatkey='echo \(\"austin\", \"OEcRNHGBuGYOMJD7m6QKEnD1SBjWSAvVdDdvH0ayLrA\"\)'
alias yhbox='cd ~/Dropbox/yhathq'
alias PCI='open ~/Dropbox/books/Programming_Collective_Intelligence_OReilly.pdf'
alias dbox='cd ~/Dropbox'
alias vim=/Applications/MacVim.app/Contents/MacOS/Vim # use MacVim by default
alias mvimtutor="mvim /usr/share/vim/vim73/tutor/tutor"

export ANALYTICS_DB='ec2-107-22-89-142.compute-1.amazonaws.com'

PATH="/usr/local/bin:${PATH}"


export PATH="~/Workspace/Lib/nbconvert:${PATH}"

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
export PYTHONPATH=$PYTHONPATH:~/Workspace/Scripts
export PATH
export PATH=$PATH:~/bin
export PATH=$PATH:~/Workspace/Scripts/bin
# ln -s /Applications/Julia.app/Contents/Resources/julia/bin/julia ~/bin/julia
export R_HOME="/Library/Frameworks/R.framework/Resources"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export AWS_ACCESS_KEY_ID=AKIAIMETEJSGSMLGFYHA
export AWS_SECRET_ACCESS_KEY=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

export YHAT_USERNAME=austinogilvie
export YHAT_APIKEY=7seXaiP35dz08chzsaw0z759ma8BSUwYZ2asgyDFU1E
export DROPBOX_ROOT=~/Dropbox

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}

source ~/.gibo-completion.bash

export STARPHLEET_HEADQUARTERS=git@github.com:yhat/austin.enterprise.git
export STARPHLEET_PRIVATE_KEY=~/.ssh/id_rsa
export STARPHLEET_PUBLIC_KEY=~/.ssh/id_rsa.pub
export EC2_INSTANCE_SIZE=m2.xlarge





