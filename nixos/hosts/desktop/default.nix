{ config, lib, hyprland, pkgs, ... }: {

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.hyprland;
  };




}



