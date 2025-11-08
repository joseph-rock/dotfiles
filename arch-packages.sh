#!/bin/bash

set -e

if [ "$EUID" -eq 0 ]; then
    echo "Don't run as root"
    exit 1
fi

echo "Updating system..."
sudo pacman -Syu --noconfirm

# Pacman
PACKAGES=(
  # Hyprland
  hyprland
  kitty
  dunst
  xdg-desktop-portal-gtk
  xdg-desktop-portal-hyprland
  hyprpolkitagent
  qt5-wayland
  qt6-wayland

  pipewire
  wireplumber

  pavucontrol
  brightnessctl
  
  hyprlock
  greetd
  rofi
  waybar
  dolphin

  networkmanager

  # Terminals
  ghostty

  # Fonts
  noto-fonts
  ttf-cascadia-mono-nerd
  woff2-font-awesome

  git
  github-cli
  man-db
  stow
  rust
  plocate

  firefox
  fastfetch
  kmonad
  wl-clipboard
)

sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

# Install yay
if ! command -v yay &> /dev/null; then
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay
fi

# AUR packages
AUR_PACKAGES=(
  bob
  webapp-manager
)

if [ ${#AUR_PACKAGES[@]} -gt 0 ]; then
    echo "Installing AUR packages..."
    yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"
fi

# bob use nightly nvim
bob install nightly
bob use nightly

echo "Done"
