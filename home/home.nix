{ pkgs, inputs, ... }:

{

  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./programs
  ];

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
    pkgs.bat
    pkgs.eza
    pkgs.neovim

    # git
    pkgs.diff-so-fancy
    pkgs.lazygit

    # programming
    pkgs.rustup

    # Node Version Manager
    pkgs.nodejs_20
    pkgs.nodenv

    # Ides
    pkgs.vscode
    pkgs.jetbrains.idea-ultimate
    pkgs.jetbrains.webstorm

    # applications
    pkgs._1password-gui
    pkgs.obsidian
    pkgs.bruno
    pkgs.brave

    # fonts
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

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

  home.stateVersion = "23.11";

  home.file = {
    ".config/nvim" = { source = ./../nvim; recursive = true; };
    ".wallpapers" = { source = ./wallpapers; recursive = true; };
  };

}
