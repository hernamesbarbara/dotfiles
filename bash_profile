# Add Homebrew `/usr/local/bin` and User `~/bin` to the `$PATH`
PATH=/usr/local/bin:$PATH

# add the bin folder in your home directory to your path
PATH=/Users/hernamesbarbara/bin:$PATH

# export the PATH variable
export PATH=/usr/local/sbin:$PATH

# rvm shit
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# source aliases
source "/Users/hernamesbarbara/.aliases"

# source .bash_prompt
source "/Users/hernamesbarbara/.bash_prompt"

# source ~/.gibo-completion.bash
source ~/.gibo-completion.bash

# {{{
# Node Completion - Auto-generated, do not touch.
shopt -s progcomp
for f in $(command ls ~/.node-completion); do
  f="$HOME/.node-completion/$f"
  test -f "$f" && . "$f"
done
# }}}


source ~/greetoftheday



