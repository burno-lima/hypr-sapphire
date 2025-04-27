#!/bin/bash

# Mata qualquer instância antiga
pkill xdg-desktop-portal-hyprland
pkill xdg-desktop-portal

# Aguarda um pouco para garantir que o Hyprland inicializou
sleep 2

# Inicia os serviços necessários
xdg-desktop-portal-hyprland &
sleep 1
xdg-desktop-portal &

