{ pkgs, ... }:

{


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

    # applications
    pkgs.slack
    pkgs._1password-gui
    pkgs.obsidian
    pkgs.bruno
    pkgs.brave
    pkgs.vscode

    # fonts
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })

  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
    };
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
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "23.11";

}
