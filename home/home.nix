{ pkgs, inputs, ... }:

{

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./programs
  ];

  home.stateVersion = "24.05";


  programs.home-manager.enable = true;

  colorScheme = inputs.nix-colors.colorSchemes.nord;

  nixpkgs.config = {
    allowUnfreePredicate = _: true;
  };

  home.packages = [

    # terminal tools
    pkgs.nixpkgs-fmt
    pkgs.jq
    pkgs.ripgrep

    pkgs.neovim

    # git
    pkgs.diff-so-fancy
    pkgs.lazygit

    # programming
    pkgs.rustup

    # Node Version Manager
    pkgs.nodejs_20
    pkgs.nodenv

    # applications
    pkgs._1password-gui
    #pkgs.obsidian
    pkgs.bruno
    pkgs.google-chrome

    # fonts
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.neofetch
  ];

  # Git Configuration 
  programs.git = {
    enable = true;
    userName = "Tomasz Bawor";
    userEmail = "bawortomasz@gmail.com";
  };

  programs.java = {
    enable = true;
    package = pkgs.temurin-bin-21;
  };

  programs.go.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Nordic";
    };

    "org/gnome/desktop/background" = {
      picture-uri = "file:///home/tomasz/.wallpapers/wallpaper4.jpg";
      picture-uri-dark = "file:///home/tomasz/.wallpapers/wallpaper4.jpg";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };


  ## Mount Files
  home.file = {
    ".config/nvim" = { source = ./../nvim; recursive = true; };
    ".wallpapers" = { source = ./wallpapers; recursive = true; };
  };

}
