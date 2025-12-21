{ config, pkgs, username, ... }:

{
  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.11";

  imports = [
    ../../../modules/home/shells/zsh.nix
    ../../../modules/home/programs/alacritty.nix
    ../../../modules/home/packages.nix
  ];
}
