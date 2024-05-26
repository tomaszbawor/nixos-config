{ config, lib, pkgs, ... }: {

  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "tomasz" ];

}
