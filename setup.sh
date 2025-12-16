#!/usr/bin/env bash
# setup.sh — replace placeholders, rename host/user folders, and rebuild

set -euo pipefail

rm -rf .git

read -rp 'User name: ' USERNAME
read -rp 'System name: ' SYSTEMNAME

# Replace placeholders across all Nix files.
find . -type f -name '*.nix' -print0 |
  xargs -0 -n 50 -P "$(nproc)" \
    sed -i "s/__USERNAME__/${USERNAME}/g; s/__SYSTEMNAME__/${SYSTEMNAME}/g"

# Rename host and user folders so paths match the filled-in flake.
if [ -d "hosts/__SYSTEMNAME__" ]; then
  mv "hosts/__SYSTEMNAME__" "hosts/${SYSTEMNAME}"
fi

if [ -d "home/users/__USERNAME__" ]; then
  mv "home/users/__USERNAME__" "home/users/${USERNAME}"
fi

hardware_path="hosts/${SYSTEMNAME}/hardware-configuration.nix"
mkdir -p "$(dirname "$hardware_path")"
nixos-generate-config --show-hardware-config >"$hardware_path"

echo "Running rebuild"
sudo nixos-rebuild switch --flake ".#${SYSTEMNAME}"
