#!/bin/bash
set -e

echo "==> Setting up LazyVim Starter..."

if [ -d "$HOME/.config/nvim" ]; then
    echo "Backing up existing Neovim config..."
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup.$(date +%s)"
fi

git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git 

rm -f ~/.config/nvim/LICENSE ~/.config/nvim/README.md ~/.config/nvim/.gitignore

echo "==> LazyVim setup completed! Open Neovim to finish plugin installation."
