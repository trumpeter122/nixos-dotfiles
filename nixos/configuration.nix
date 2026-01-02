{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
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

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      # Import your home-manager configuration
      __USERNAME__ = import ../home-manager/home.nix;
    };
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Australia/Perth";

  environment.shells = [ pkgs.zsh ];

  services.v2raya.enable = true;

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        experimental-features = "nix-command flakes";
        flake-registry = "";
        nix-path = config.nix.nixPath;
      };
      # channel.enable = false;

      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;

      gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 7d";
      };
    };

  networking.hostName = "__HOSTNAME__";

  users.users = {
    __USERNAME__ = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  system.stateVersion = "25.11";
}
