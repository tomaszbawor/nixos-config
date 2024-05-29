{ config
, pkgs
, lib
, ...
}: {
  home.packages = lib.optionals config.programs.alacritty.enable [ pkgs.nerdfonts ];

  programs.alacritty = {
    enable = true;

    settings = {

      font = {
        normal = {
          family = "FiraCode Nerd Font Mono";
          style = "Medium";
        };
        size = 12;
      };

      colors = with config.colorScheme.palette; {
        bright = {
          black = "#${base00}";
          blue = "#${base0D}";
          cyan = "#${base0C}";
          green = "#${base0B}";
          magenta = "#${base0E}";
          red = "#${base08}";
          white = "#${base06}";
          yellow = "#${base09}";
        };
        cursor = {
          cursor = "#${base06}";
          text = "#${base06}";
        };
        normal = {
          black = "#${base00}";
          blue = "#${base0D}";
          cyan = "#${base0C}";
          green = "#${base0B}";
          magenta = "#${base0E}";
          red = "#${base08}";
          white = "#${base06}";
          yellow = "#${base0A}";
        };
        primary = {
          background = "#${base00}";
          foreground = "#${base06}";
        };
      };

      window = {
        blur = true;
        opacity = 0.9;
        decorations = "Buttonless";
        padding = {
          x = 12;
          y = 12;
        };
      };
    };
  };
}
