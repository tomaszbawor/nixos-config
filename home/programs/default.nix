{ pkgs
, ...
}: {
  imports = [
    ./alacritty
    ./dunst
    ./hypr
    ./rofi
    ./waybar
    ./zsh

  ];


  home.packages = (with pkgs; [

    #User Apps
    celluloid

    librewolf
    cool-retro-term
    bibata-cursors
    vscode
    lollypop
    lutris


    #utils
    ranger
    wlr-randr
    git
    rustup
    gnumake
    catimg
    curl
    appimage-run
    xflux
    dunst
    pavucontrol
    sqlite

    #misc
    cava
    rofi
    nitch
    wget
    grim
    slurp
    wl-clipboard
    pamixer
    mpc-cli
    tty-clock

    tokyo-night-gtk

  ]) ++ (with pkgs.gnome; [
    nautilus
    zenity
    gnome-tweaks
    eog

  ]);

}
