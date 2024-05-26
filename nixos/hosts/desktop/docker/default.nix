{ config, lib, pkgs, ... }: {

  # Docker
  virtualisation.docker.enable = true;

  users.extraGroups.docker.members = [ "tomasz" ];


}
