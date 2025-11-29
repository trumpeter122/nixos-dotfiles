{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "__SYSTEMNAME__";
  networking.networkmanager.enable = true;

  time.timeZone = "Australia/Perth";

  users.users.__USERNAME__ = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  services.displayManager.ly.enable = true;
  programs.niri.enable = true;

  programs.firefox.enable = true;
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty
    git
    vim
    wget
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # Nix
  nixpkgs.config.allowUnfree = false;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "25.05";
}
