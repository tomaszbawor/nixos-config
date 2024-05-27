{ config, lib, pkgs, ... }: {

  programs = {
    steam = {
      enable = true; # Enable Steam
      gamescopeSession.enable = true;
    };
  };

}
