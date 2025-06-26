export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="half-life"

plugins=(git)

source $ZSH/oh-my-zsh.sh

for file in ~/.zsh/*.zsh; do
  source "$file"
done
