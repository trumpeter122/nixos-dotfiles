{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${system}.default
    fuzzel
    vesktop
    kitty
    fastfetch
  ];
}
