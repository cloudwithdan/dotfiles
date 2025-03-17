# fzf
if [[ -x "$(command -v fzf)" ]]; then
  # Expansion of `**` with fd
  if [[ -x "$(command -v fd)" ]]; then
    _fzf_compgen_path() {
      fd --hidden --exclude .git . "$1"
    }

    _fzf_compgen_dir() {
      fd --type=d --hidden --exclude .git . "$1"
    }
  fi

  # fzf tab completion
  zinit light Aloxaf/fzf-tab
  zstyle ':completion:*' menu no
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

  source <(fzf --zsh)
fi
