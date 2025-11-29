{ config, pkgs, ... }:

{
  home.username = "__USERNAME__";
  home.homeDirectory = "/home/__USERNAME__";
  programs.git.enable = true;
  home.stateVersion = "25.05";
  programs.bash = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
    };
  };
}
