#!/bin/bash
set -e

# Set variables
DOTFILES_DIR="$(pwd)"
CONFIGS_DIR="$DOTFILES_DIR/config"
CONFIGS_TO_SYNC=(
  btop
  fish
  hypr
  kitty
  nvim
  tmux
  swaylock
  waybar
  wlogout
  wofi
  sddm
)

echo "==> Syncing configuration files..."

# Ensure the config directory exists
mkdir -p "$CONFIGS_DIR"

# Loop through each config and sync it
for config in "${CONFIGS_TO_SYNC[@]}"; do
  if [ -d "$HOME/.config/$config" ]; then
    echo "Copying $config..."
    rm -rf "$CONFIGS_DIR/$config" # Clean previous version
    cp -r "$HOME/.config/$config" "$CONFIGS_DIR/"
  else
    echo "Warning: $config not found in ~/.config, skipping..."
  fi
done

echo "==> Syncing SDDM configurations..."
cp -r ~/.config/sddm/* /etc/sddm.conf.d/
echo "==> SDDM configurations synced!"

echo "==> Configs synced and pushed successfully!"
