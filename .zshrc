export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="half-life"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# export NVM_DIR="/Users/daniel.nikolski/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

for file in ~/.zsh/*.zsh; do
  source "$file"
done
