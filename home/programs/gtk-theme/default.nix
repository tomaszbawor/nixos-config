{ config, pkgs, ... }: {

  gtk = {
    enable = true;

    font = {
      name = "FiraCode Nerd Font Mono";
      package = pkgs.jetbrains-mono;
    };

    iconTheme = {
      name = "Yaru-magenta-dark";
      package = pkgs.yaru-theme;
    };

    theme = {
      name = "Tokyonight-Dark-B-LB";
      package = pkgs.tokyo-night-gtk;
    };

    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
    };
  };
}
