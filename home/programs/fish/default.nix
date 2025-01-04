{ config
, pkgs
, lib
, ...
}: {

  home.packages = [
    pkgs.bat # Better cat
    pkgs.eza # Better LS
  ];

  programs.fish = {
    enable = true;
    generateCompletions = true;
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

  # Helper programs used in my ZSH Setup
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };
}
