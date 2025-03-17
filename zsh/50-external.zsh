#
# External shell configurations
#

# Set default editor
if [[ -x "$(command -v nvim)" ]]
then
  export EDITOR=nvim
  export VISUAL=nvim
else
  export EDITOR=vim
  export VISUAL=vim
fi

# Ghostty
if [ -f "$GHOSTTY_RESOURCES_DIR/shell-integration/zsh/ghostty-integration" ]; then
    source "$GHOSTTY_RESOURCES_DIR/shell-integration/zsh/ghostty-integration"
fi
