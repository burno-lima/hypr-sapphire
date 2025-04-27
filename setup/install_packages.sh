#!/bin/bash
set -e

packages=(
    hyprland
    waybar
    wofi
    kitty
    neovim
    fish
    tmux
    swaylock
    wlogout
    dolphin
    btop
    fzf
    ripgrep
    fd
    xdg-desktop-portal-hyprland
    xdg-desktop-portal
    eza
)

echo "==> Installing packages..."
sudo pacman -S --needed --noconfirm "${packages[@]}"

# Após instalar os pacotes, chamar o script de plugins do Fish
echo "==> Now installing Fish plugins and configuring Fish shell..."
./install_fish_plugins.sh

echo "==> Installation complete!"
