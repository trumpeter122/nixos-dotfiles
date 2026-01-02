{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
  ];

  nixpkgs = {
    overlays = [
      inputs.self.overlays.additions
      inputs.self.overlays.modifications
      inputs.self.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "__USERNAME__";
    homeDirectory = "/home/__USERNAME__";
  };

  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.firefox.enable = true;
  programs.zsh.enable = true;

  # services.v2raya.enable = true;

  home.packages = with pkgs; [
    alacritty
    bluetui
    btop
    fastfetch
    git
    kitty
    nautilus
    neovim
    peaclock
    ranger
    starship
    tree
    ttyper
    uv
    vim
    wget
    yazi
    zsh
    zellij
  ];

  home.shells = [ pkgs.zsh ];

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "25.11";
}
