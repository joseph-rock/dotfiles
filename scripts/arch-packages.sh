#!/bin/bash

set -e

if [ "$EUID" -eq 0 ]; then
    echo "Don't run as root"
    exit 1
fi

echo "Updating system..."
sudo pacman -Syu --noconfirm

PACKAGES=(
  hyprland
  kitty
  dunst
  xdg-desktop-portal-gtk
  xdg-desktop-portal-hyprland
  hyprpolkitagent
  qt5-wayland
  qt6-wayland
  qt5ct
  qt6ct
  kvantum
  breeze-icons
  nwg-look
  adw-gtk-theme
  pipewire
  wireplumber
  networkmanager
  network-manager-applet
  blueman
  pavucontrol
  brightnessctl
  swayosd
  ghostty
  hyprlock
  greetd
  rofi
  waybar
  nautilus
  neovim
  fastfetch
  hyprshot
  hyprpicker
  htop
  noto-fonts
  ttf-cascadia-mono-nerd
  ttf-nerd-fonts-symbols
  woff2-font-awesome
  otf-font-awesome
  inter-font
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
  rust
  luarocks
  lua51
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
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay
    makepkg -si --noconfirm
    cd -
    rm -rf /tmp/yay
fi

AUR_PACKAGES=(
  webapp-manager
  librewolf-bin
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
sudo cp ./nobeep.conf /etc/modprobe.d/nobeep.conf

echo "Done"
