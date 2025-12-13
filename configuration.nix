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

  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver = {
    enable = true;
    windowManager.qtile.enable = true;
  };

  users.users.__USERNAME__ = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    # packages = with pkgs; [
    # ];
  };

  program.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    neovim
    alacritty
    git
    zellij
    tree
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "25.02";
}
