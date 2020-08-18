function cwd() {
    if [ "$1" != "" ]
        then
            P=$(greadlink "$1" -f --no-newline)
        else
            P=$(greadlink "." -f --no-newline)
    fi
    P=$(echo -e "$P" | sed -e "s/\/Users\/$(whoami)/~/g")
    P=$(echo -e "$P" | sed 's/ /\\ /g')
    P=$(echo -e "$P" | sed 's/(/\\(/g')
    P=$(echo -e "$P" | sed 's/)/\\)/g')
    echo -e "$P" | tr -d '\r\n' | pbcopy
}


function last_cmd_status () {
  if [ $? = 0 ]; then
    echo -e '\e[32m0\e[0m'
    return 0
  else
    echo -e '\e[31m$?\e[0m'
  return $?
fi
}


# Call from a local repo to open the repository on github in browser
function github() {
 giturl=$(git config --get remote.origin.url)
 if [ -z "$giturl" ]
    then
        echo "Not a git repository or no remote.origin.url set";
    else
        giturl=${giturl/git\@github\.com\:/https://github.com/}
        giturl=${giturl/\.git//}
        echo $giturl
        open $giturl
    fi
}



function o() {
    if [[ -z "$@" ]]; then
        open .
    else
        open "$1"
    fi
}

alias h='history '

function mkd () { mkdir -p "$@" && cd "$@"; }
function lh() { ls -ld .?*  --block-size=MB "$@"; }    # list hidden files only

alias ll='ls -lh'

alias cp="cp -i"   # interactive copy / prompt before overwriting
alias mv="mv -i"   # interactive move / prompt before overwriting
alias excel="open -a Microsoft\ Excel"
alias chrome="open -a Google\ Chrome"
alias rmpyc="find . -name '*.pyc' -type f -delete"
alias ccat="pygmentize -O style=solarized-dark -f console256 -g"

alias h="history "




