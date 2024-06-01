{ config, lib, pkgs, ... }: {

  imports = [
    ./nvidia
    ./docker
    ./steam
  ];

  # Disable autosuspend deamon
  services.autosuspend.enable = false;
}
