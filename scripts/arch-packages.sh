#!/bin/bash

set -e

if [ "$EUID" -eq 0 ]; then
    echo "Don't run as root"
    exit 1
fi

echo "Updating system..."
sudo pacman -Syu --noconfirm

PACKAGES=(
  # Hyprland Reqs
  hyprland
  kitty
  dunst
  xdg-desktop-portal-gtk
  xdg-desktop-portal-hyprland
  hyprpolkitagent
  qt5-wayland
  qt6-wayland
  nwg-look # set GTK themes

  #themes
  adw-gtk-theme

  # Services
  pipewire
  wireplumber
  networkmanager
  network-manager-applet
  blueman
  pavucontrol
  brightnessctl
  swayosd

  # Core Apps
  ghostty
  hyprlock
  greetd
  rofi
  waybar
  nautilus
  firefox
  bob
  fastfetch
  hyprshot
  hyprpicker

  # Fonts
  noto-fonts
  ttf-cascadia-mono-nerd
  ttf-nerd-font-symbols
  woff2-font-awesome
  otf-font-awesome # waybar req
  inter-font

  # Utils
  git
  github-cli
  openssh
  man-db
  stow
  plocate
  kmonad
  wl-clipboard
  unzip
  wget
  fd

  # Languages
  rust
  luarocks
  lua51 # nvim req
  python
  python-pip
  ruby
  composer
  php
  nodejs
  npm
  julia
  jdk17-openjdk
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

AUR_PACKAGES=(
  webapp-manager
)

if [ ${#AUR_PACKAGES[@]} -gt 0 ]; then
    echo "Installing AUR packages..."
    yay -S --needed --noconfirm "${AUR_PACKAGES[@]}"
fi

# Start process
sudo systemctl start NetworkManager.service
sudo systemctl enable greetd.service
sudo systemctl enable --now swayosd-libinput-backend.service

# Turn off computer beep
sudo rmmod pcspkr
sudo rmmod snd_pcsp
sudo mv ./nobeep.conf /etc/modprobe.d/nobeep.conf

echo "Done"
