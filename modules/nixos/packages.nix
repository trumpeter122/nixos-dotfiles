{ pkgs, ... }:

{
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
    yazi
    zsh
    zellij
  ];

  programs.firefox.enable = true;
  services.v2raya.enable = true;
}
