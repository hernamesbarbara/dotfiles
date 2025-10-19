#!/usr/bin/env zsh
# -*- coding: utf-8 -*-

export PATH="/opt/homebrew/bin:$PATH"

export ZSH=~/.oh-my-zsh

export EDITOR='code --wait'
# export VISUAL="$EDITOR"

####################################
# KEYBINDINGS
####################################

# 1. Delete from cursor to beginning of line
bindkey "^U" backward-kill-line  

# 2. Swap the last two words before the cursor
bindkey "^T" transpose-words   

# 3. Incremental history search (Ctrl + R)
bindkey "^R" history-incremental-search-backward  

# 4. Insert last argument of the previous command (Alt + . cycles through them)
bindkey "^[." insert-last-word  

# 5. Move left by one word (Alt + B)
bindkey "^[b" backward-word    

# 6. Move right by one word (Alt + F)
bindkey "^[f" forward-word     

# 7. Restore the command line to its original state before editing (Ctrl + G)
bindkey "^G" send-break        

# 8. Open the current command in your text editor (Ctrl + X, then Ctrl + E)
bindkey "^X^E" vi-editing-mode  

# 9. Delete the previous word instead of just a single character (Ctrl + W)
bindkey "^W" backward-kill-word  

# 10. Expand history commands and variables before execution (Ctrl + X, then Ctrl + V)
bindkey "^X^V" expand-history  

# 11. Push the current line to a temp stack, clear the prompt, and recall it later (Ctrl + Q)
bindkey "^Q" push-line-or-edit  

# 12. Automatically correct mistyped command names (e.g., 'gti' → 'git')
setopt correct  

# 13. Enable auto-lowercasing of directory/file paths (even if typed in uppercase)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


####################################
# HISTORY SETTINGS
export SAVEHIST=500000
export HISTSIZE=500000
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HIST_STAMPS="yyyy-mm-dd"

setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE    # do not record any line starting with a space

####################################
# LOCALE SETTINGS
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"

####################################
# FUNCTIONS
fpath=(~/.zshfunctions ~/.zsh/completions $fpath)

autoload -Uz cwd github last_cmd_status mkd o c zmv url_clean url_humanize lh lsd wifi_qr_code ebookify cleanup ccat g_ignore watch_dirs

source ~/.config/zsh/set_pycache_prefix.zsh

####################################
# COMPLETION
autoload -U compinit

# Define the zcompdump file path
ZSH_COMPDUMP="${ZDOTDIR:-$HOME}/.zcompdump"

# Use cached completions if available
if [[ -f $ZSH_COMPDUMP.zwc ]]; then
  compinit -C
elif compinit; then
  [[ -f $ZSH_COMPDUMP ]] && zcompile $ZSH_COMPDUMP
fi


####################################
# ZSH SETTINGS
export TERM="xterm-256color"
ZSH_THEME="robbyrussell"
plugins=(git z jsontools isodate)

zstyle ':completion:*' menu select
source $ZSH/oh-my-zsh.sh

####################################
# PATH SETTINGS
export PATH="$HOME/Library/Python/3.11/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"
export PATH="$(brew --prefix)/opt/ruby/bin:$PATH"
export PATH="$(brew --prefix)/lib/ruby/gems/3.2.0/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

[ -f ~/.env_private ] && source ~/.env_private

if [[ -x ~/.greetoftheday ]]; then
  ~/.greetoftheday
fi

source ~/.aliases.zsh

[ -f ~/.api_keys ] && source ~/.api_keys


####################################
# SYNTAX HIGHLIGHTING
if [[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/hernamesbarbara/.lmstudio/bin"
# End of LM Studio CLI section
export PATH="$HOME/.cargo/bin:$PATH"
export CLAUDE_INSTALL_METHOD=homebrew

# pnpm
export PNPM_HOME="/Users/hernamesbarbara/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
