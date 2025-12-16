{ config, pkgs, ... }:

{
  home.username = "__USERNAME__";
  home.homeDirectory = "/home/__USERNAME__";
  home.stateVersion = "24.11";

  imports = [
    ../../../modules/home/shells/zsh.nix
    ../../../modules/home/programs/alacritty.nix
    ../../../modules/home/packages.nix
  ];
}
