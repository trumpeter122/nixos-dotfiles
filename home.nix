{ config, pkgs, ... }:

{
  home.username = "__USERNAME__";
  home.homeDirectory = "/home/__USERNAME__";
  home.stateVersion = "24.11";

  programs.bash = {
    enable = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.90;
        decorations = "None";
      };
      font = {
        size = 12.0;
        normal = {
          family = "DepartureMono Nerd Font";
        };
      };
      cursor = {
        style = {
          shape = "Block";
          blinking = "On";
        };
        blink_interval = 500;
      };

      mouse = {
        hide_when_typing = true;
      };
      keyboard = {
        bindings = [
          {
            key = "N";
            mods = "Control|Shift";
            action = "SpawnNewInstance";
          }
        ];
      };
      env = {
        TERM = "xterm-256color";
      };
    };
  };

  home.packages = with pkgs; [

  ];
}
