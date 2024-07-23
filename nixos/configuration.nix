# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, home-manager, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./hosts/desktop
    ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Kernel version
  boot.kernelPackages = pkgs.linuxPackages_6_9;

  # Bootloader config
  boot.loader = {
    efi.efiSysMountPoint = "/boot";
    grub = {
      enable = true;
      configurationLimit = 10;
      devices = [ "nodev" ];
      efiInstallAsRemovable = true;
      efiSupport = true;
      useOSProber = true;
      theme = pkgs.stdenv.mkDerivation {
        pname = "distro-grub-themes";
        version = "3.1";
        src = pkgs.fetchFromGitHub {
          owner = "AdisonCavani";
          repo = "distro-grub-themes";
          rev = "v3.1";
          hash = "sha256-ZcoGbbOMDDwjLhsvs77C7G7vINQnprdfI37a9ccrmPs=";
        };
        installPhase = "cp -r customize/nixos $out";
      };
    };
  };

  # Networking
  networking = {
    hostName = "tomasz-nixos-desktop"; # Define your hostname.
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # xServer
  services.xserver = {
    enable = true; # Enable the X11 windowing system.
    displayManager = {
      gdm = {
        enable = true;
        autoSuspend = false;
      };
    };

    desktopManager = {
      gnome.enable = true;
    };

    xkb = {
      # Keyboard layout
      layout = "pl";
      variant = "";
    };
    videoDrivers = [ "nvidia" ];
  };

  # Flatpak App Installer
  services.flatpak.enable = true;

  # Configure console keymap
  console.keyMap = "pl2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account
  users = {
    users.tomasz = {
      isNormalUser = true;
      description = "tomasz";
      extraGroups = [ "networkmanager" "wheel" ];
    };
    defaultUserShell = pkgs.zsh;
  };


  # Allow Nixpkgs to install unfree software
  environment.variables = {
    NIXPKGS_ALLOW_UNFREE = "1";
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  # List packages installed in system profile
  environment.systemPackages = with pkgs; [
    vim
    wget

    # Lazy Vim deps
    gcc
    zig
    unzip
    # Lazy Vim deps END

    # Gnome
    gnome-tweaks
    gnomeExtensions.forge

  ];

  system.autoUpgrade = {
    enable = true;
    channel = "https://nixos.org/channels/nixos-24.05";
  };

  # Enabling ZSH on system level
  programs = {
    zsh.enable = true; # Install ZSH to the system
  };

  system.stateVersion = "24.05"; # Did you read the comment?

}
