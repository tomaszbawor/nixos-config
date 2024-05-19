{ config, lib, pkgs, ... }: {

  programs.regreet.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        user = "tomasz";
        command = "$SHELL -l";
      };
    };
  };


  programs.dconf.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

}
