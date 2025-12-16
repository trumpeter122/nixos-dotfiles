{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.75;
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
}
