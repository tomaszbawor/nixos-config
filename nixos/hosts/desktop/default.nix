{ config, lib, pkgs, ... }: {

  imports = [
    ./nvidia
    ./docker
    ./steam
  ];


}
