{ config, lib, hyprland, pkgs, ... }: {


  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.hyprland;
  };

  programs.waybar.enable = true;

  # programs.regreet.enable = true;
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     initial_session = {
  #       user = "tomasz";
  #       command = "$SHELL -l";
  #     };
  #   };
  # };

  # programs.dconf.enable = true;

  #xdg.portal = {
  #  enable = true;
  #  wlr.enable = true;
  #};
}
