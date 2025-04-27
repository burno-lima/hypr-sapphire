#!/bin/bash
set -e

# Verificar se o Fish está instalado
if ! command -v fish &> /dev/null
then
    echo "==> Fish shell is not installed. Please install Fish first."
    exit 1
else
    echo "==> Fish shell found, proceeding with plugin installation..."
fi

# Instalar o Fish plugin manager - Fisher, caso não esteja instalado
if ! command -v fisher &> /dev/null
then
    echo "==> Installing Fisher plugin manager..."
    curl -sL https://git.io/fisher | fish
else
    echo "==> Fisher is already installed."
fi

# Instalar o tema Tide para o Fish
echo "==> Installing Tide theme for Fish..."
fisher install ilancosman/tide

echo "==> Fish plugins installed successfully!"
