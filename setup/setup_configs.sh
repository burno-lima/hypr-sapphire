#!/bin/bash
set -e

DOTFILES_DIR="$(pwd)"

configs=(
    hypr
    waybar
    wofi
    kitty
    fish
    tmux
)

echo "==> Copying configuration files to ~/.config..."

for config in "${configs[@]}"; do
    if [ -d "$HOME/.config/$config" ]; then
        echo "Backup existing configuration: $config"
        mv "$HOME/.config/$config" "$HOME/.config/${config}.backup.$(date +%s)"
    fi
    cp -r "$DOTFILES_DIR/config/$config" "$HOME/.config/"
done

echo "==> Configurations applied successfully!"
