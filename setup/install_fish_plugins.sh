#!/bin/bash
set -e

# Verificar se o Fish está instalado
if ! command -v fish &>/dev/null; then
  echo "==> Fish shell is not installed. Please install Fish first."
  exit 1
else
  echo "==> Fish shell found, proceeding with plugin installation..."
fi

# Instalar o Fish plugin manager - Fisher, caso não esteja instalado
if ! command -v fisher &>/dev/null; then
  echo "==> Installing Fisher plugin manager..."
  fish -c 'curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher'
else
  echo "==> Fisher is already installed."
fi

# Instalar o tema Tide para o Fish
echo "==> Installing Tide theme for Fish..."
fish -c 'fisher install ilancosman/tide'

# deixar o fish com shell defeult
command -v fish | sudo tee -a /etc/shells
chsh -s "$(command -v fish)"

echo "==> Fish plugins installed and Fish set as default sehll successfully!"
