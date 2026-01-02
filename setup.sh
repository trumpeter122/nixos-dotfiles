#!/usr/bin/env bash
# setup.sh — replace placeholders, rename host/user folders, and rebuild

set -euo pipefail

echo SETUP: Syncing repo with the origin

# rm -rf .git
git fetch origin
git reset --hard origin/main
git clean -fd

read -rp 'User name: ' USERNAME
read -rp 'Host name: ' HOSTNAME

# Replace placeholders across all Nix files.
find . -type f -name '*.nix' -print0 |
  xargs -0 -n 50 -P "$(nproc)" \
    sed -i "s/__USERNAME__/${USERNAME}/g; s/__HOSTNAME__/${HOSTNAME}/g"

# Rename host and user folders so paths match the filled-in flake.
if [ -d "hosts/__HOSTNAME__" ]; then
  mv "hosts/__HOSTNAME__" "hosts/${HOSTNAME}"
fi

if [ -d "home/users/__USERNAME__" ]; then
  mv "home/users/__USERNAME__" "home/users/${USERNAME}"
fi

hardware_path="nixos/hardware-configuration.nix"
mkdir -p "$(dirname "$hardware_path")"
nixos-generate-config --show-hardware-config >"$hardware_path"

git add .
git -c user.name='autocommit' -c user.email='autocommit@local.com' commit -m "auto: prebuild"

echo "Running rebuild"
sudo nixos-rebuild switch --flake ".#${HOSTNAME}"
