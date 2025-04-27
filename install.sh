#!/bin/bash
set -e

check_program() {
    if ! command -v "$1" &> /dev/null; then
        echo "Error: $1 is not installed."
        exit 1
    fi
}

echo "==> Checking basic dependencies..."
check_program git
check_program sudo

echo "==> Updating system packages..."
sudo pacman -Syu --noconfirm

echo "==> Installing required packages..."
bash setup/install_packages.sh

echo "==> Copying configuration files..."
bash setup/setup_configs.sh

echo "==> Setting up LazyVim..."
bash setup/setup_lazyvim.sh

echo "==> Installing GPU drivers..."
bash setup/setup_gpu.sh

echo "==> Installation complete! You can now reboot or start Hyprland!"
