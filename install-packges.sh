#!/usr/bin/env bash

set -euo pipefail

# Define your packages
PACMAN_PACKAGES=(
  git
  neovim
  htop
)

AUR_PACKAGES=(
  # System
  visual-studio-code-bin
  zen-browser-bin
  ghostty
  fd
  bat
  ripgrep
  eza
  zoxide
  atuin
  lazygit
  dysk
  # Fonts
  ttf-firacode-nerd
  # K8s
  sops
  k9s
  kubectl
  helm
  talosctl
  # Hyprland
  rofi
  waybar
)

# Install oh-my-zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "oh-my-zsh is already installed."
fi

# Function to check if a package is installed
is_installed() {
  pacman -Q "$1" &>/dev/null
}

# Ensure yay is installed
install_yay() {
  if ! command -v yay &>/dev/null; then
    echo "Installing yay (AUR helper)..."
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
  else
    echo "yay is already installed."
  fi
}

# Install official repo packages
install_pacman_packages() {
  echo "Installing official packages via pacman..."
  for pkg in "${PACMAN_PACKAGES[@]}"; do
    if is_installed "$pkg"; then
      echo "✓ $pkg already installed."
    else
      sudo pacman -S --noconfirm "$pkg"
    fi
  done
}

# Install AUR packages
install_aur_packages() {
  echo "Installing AUR packages via yay..."
  for pkg in "${AUR_PACKAGES[@]}"; do
    if is_installed "$pkg"; then
      echo "✓ $pkg already installed."
    else
      yay -S --noconfirm "$pkg"
    fi
  done
}

main() {
  echo "Starting package installation..."
  install_yay
  install_pacman_packages
  install_aur_packages
  echo "All packages installed successfully."
}

main "$@"
