{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.departure-mono
    nerd-fonts.jetbrains-mono
  ];
}
