{ hyprland, pkgs, ... }:

{

  imports = [
    hyprland.homeManagerModules.default
    ./programs
    ./scripts
  ];

  programs.home-manager.enable = true;

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
    pkgs.nodejs_20

    # Ides
    pkgs.vscode
    pkgs.jetbrains.idea-ultimate

    # applications
    pkgs.slack
    pkgs._1password-gui
    pkgs.obsidian
    pkgs.bruno
    pkgs.brave

    # fonts
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

    # copied from other repo 
    pkgs.cool-retro-term
    pkgs.bibata-cursors
    pkgs.lutris
    pkgs.openrgb

    #utils
    pkgs.ranger
    pkgs.wlr-randr

    pkgs.catimg
    pkgs.curl
    pkgs.xflux
    pkgs.dunst
    pkgs.pavucontrol


    #misc 
    pkgs.cava
    pkgs.rofi
    pkgs.nitch
    pkgs.wget
    pkgs.grim
    pkgs.slurp
    pkgs.wl-clipboard
    pkgs.pamixer
    pkgs.mpc-cli
    pkgs.tty-clock


    pkgs.tokyo-night-gtk


    pkgs.gnome.nautilus
    pkgs.gnome.zenity
    pkgs.gnome.gnome-tweaks
    pkgs.gnome.eog
    pkgs.gedit

  ];



  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
    };
    autosuggestion.enable = true;
    shellAliases = {
      ls = "eza";
      cat = "bat";
      lg = "lazygit";

      vim = "nvim";
      v = "nvim .";
      # Git 
      gdc = "git diff --cached";
      glog = "git log --oneline";

      # Gradle
      gb = "./gradlew build";
      gkf = "./gradlew ktlintFormat";
    };
  };

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

  programs.chromium.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Tokyonight-Dark-B-LB";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "23.11";

  home.file = {
    ".config/nvim" = { source = ./../nvim; recursive = true; };
  };

}
