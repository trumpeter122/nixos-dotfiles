{ inputs, username, hostname, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/core.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/fonts.nix
    ../../modules/nixos/docker.nix
    ../../modules/nixos/packages.nix
    ../../modules/nixos/shells.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/home-manager.nix
    ../../modules/nixos/noctalia.nix
    ../../modules/nixos/stylix.nix
  ];

  networking.hostName = hostname;

  system.stateVersion = "25.05";
}
