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

  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.backupFileExtension = "backup";
  home-manager.users.__USERNAME__ = import ./home.nix;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "__SYSTEMNAME__";
  networking.networkmanager.enable = true;

  time.timeZone = "Australia/Perth";

  services.displayManager.ly.enable = true;
  services.xserver = {
    enable = true;
  };
  programs.niri.enable = true;

  users.users.__USERNAME__ = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    # packages = with pkgs; [
    # ];
  };

  programs.firefox.enable = true;
  services.v2raya.enable = true;

  environment.systemPackages = with pkgs; [
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
    zellij
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.departure-mono
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "25.05";
}
