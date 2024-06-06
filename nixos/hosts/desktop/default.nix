{ config, lib, pkgs, ... }: {

  imports = [
    ./nvidia
    ./docker
    ./steam
    ./hyprland
  ];

  # Disable autosuspend deamon
  services.autosuspend.enable = false;

  # Disable power management
  powerManagement.enable = false;
}
