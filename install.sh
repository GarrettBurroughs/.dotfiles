#!/bin/bash

# 1. Install Nix in single-user mode (no daemon required)
# sh <(curl -L https://nixos.org/nix/install) --no-daemon

# 2. Source the Nix environment so the current script can use the 'nix' command
# . ~/.nix-profile/etc/profile.d/nix.sh

# 3. Enable flakes temporarily for the install command
# mkdir -p ~/.config/nix
# echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf

# 4. Run your Home Manager flake
# nix run github:nix-community/home-manager -- switch --flake .#$USER -b backup
