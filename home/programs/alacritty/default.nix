{ config
, pkgs
, lib
, ...
}: {
  home.packages = lib.optionals config.programs.alacritty.enable [ pkgs.nerdfonts ];

  programs.alacritty = {
    enable = true;

    settings = {
      import = [
        "${pkgs.vimPlugins.nightfox-nvim}/extra/carbonfox/nightfox_alacritty.yml"
      ];

      font = {
        normal = {
          family = "FiraCode Nerd Font Mono";
          style = "Medium";
        };
        size = 12;
      };

      window = {
        padding = {
          x = 12;
          y = 12;
        };
      };
    };
  };
}
