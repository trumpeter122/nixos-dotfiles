#!/usr/bin/env bash
# fill-names.sh — replace __USERNAME__ and __SYSTEMNAME__ in every regular file
# Usage: run inside the top-level directory of your project.

set -euo pipefail

rm -rf .git

read -rp 'User name: ' USERNAME
read -rp 'System name: ' SYSTEMNAME

# Find every regular file, feed paths to sed in batches.
find . -type f -name '*.nix' -print0 |
  xargs -0 -n 50 -P "$(nproc)" \
    sed -i "s/__USERNAME__/${USERNAME}/g; s/__SYSTEMNAME__/${SYSTEMNAME}/g"

nixos-generate-config --show-hardware-config >hardware-configuration.nix

echo "Running rebuild"

# sudo nixos-rebuild switch -I nixos-config=./configuration.nix
sudo nixos-rebuild switch --flake .#$SYSTEMNAME
