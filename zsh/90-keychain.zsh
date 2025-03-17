if [ -x "$(command -v keychain)" ]; then
  eval $(keychain --eval daniel_ed25519)
fi
