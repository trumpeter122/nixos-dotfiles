{ ... }:

{
  networking.networkmanager.enable = true;

  time.timeZone = "Australia/Perth";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
}
