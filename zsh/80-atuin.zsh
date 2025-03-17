# atuin shell history

if [[ -x "$(command -v atuin)" ]]; then
    export ATUIN_NOBIND="true"
    eval "$(atuin init zsh)"

fi
