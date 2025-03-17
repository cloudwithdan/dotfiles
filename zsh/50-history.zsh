# history settings
setopt appendhistory
setopt sharehistory
setopt inc_append_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=$HISTSIZE
HISTDUP=erase

autoload -Uz history-search-end
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
