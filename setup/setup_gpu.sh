#!/bin/bash
set -e

echo "==> Detecting GPU and installing appropriate drivers..."

if lspci | grep -i nvidia &> /dev/null; then
    echo "NVIDIA GPU detected. Installing drivers..."
    sudo pacman -S --needed --noconfirm nvidia nvidia-utils nvidia-settings
elif lspci | grep -i 'AMD/ATI' &> /dev/null; then
    echo "AMD GPU detected. Installing Mesa and AMDGPU drivers..."
    sudo pacman -S --needed --noconfirm mesa mesa-utils xf86-video-amdgpu vulkan-radeon libva-mesa-driver
else
    echo "No NVIDIA or AMD GPU detected. Skipping GPU driver installation."
fi

echo "==> GPU driver installation completed!"
