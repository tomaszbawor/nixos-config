{ config
, pkgs
, lib
, ...
}: {

  home.packages = [
    pkgs.vscode

    pkgs.jetbrains.idea-ultimate
    pkgs.jetbrains.webstorm
    pkgs.jetbrains.rust-rover

  ];

}
