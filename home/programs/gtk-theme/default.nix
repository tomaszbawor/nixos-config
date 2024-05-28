{ config, pkgs, ... }: {

  gtk = {
    enable = true;

    font = {
      name = "FiraCode Nerd Font Mono";
      package = pkgs.fira;
    };

    iconTheme = {
      name = "Yaru-magenta-dark";
      package = pkgs.yaru-theme;
    };

    theme = {
      name = "Nordic";
      package = pkgs.nordic;
    };

    cursorTheme = {
      name = "Nordic-cursors";
      package = pkgs.nordic;
    };
  };
}
