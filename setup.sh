#! /bin/bash

set -o pipefail

parted /dev/sda -- mklabel gpt
parted /dev/sda -- mkpart root ext4 512MB -4GB
parted /dev/sda -- mkpart swap linux-swap -4GB 100%

parted /dev/sda -- mkpart ESP fat32 1MB 512MB
parted /dev/sda -- set 3 esp on

mkfs.ext4 -L nixos /dev/sda1
mkswap -L swap /dev/sda2
mkfs.fat -F 32 -n boot /dev/sda3

mount /dev/sda1 /mnt
mkdir -p /mnt/boot
mount -o umask=077 /dev/sda3 /mnt/boot
swapon /dev/sda2

nixos-generate-config --root /mnt

cd /mnt/etc/nixos || exit
