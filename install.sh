#!/usr/bin/env bash

set -e # Exit on error

echo "Starting gburroughs development environment setup..."

if ! command -v nix &> /dev/null; then
    echo "Installing Nix..."
    curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
    
    . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
else
    echo "Nix is already installed."
fi

mkdir -p ~/.config/nix
if ! grep -q "experimental-features" ~/.config/nix/nix.conf 2>/dev/null; then
    echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
    echo "Enabled Nix Flakes."
fi

echo "Running Home Manager switch..."
nix run github:nix-community/home-manager -- switch --flake .#gburroughs -b backup

echo "Setup complete! Restart your terminal or run 'exec zsh'."
