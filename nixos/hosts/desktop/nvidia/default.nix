{ config, lib, pkgs, ... }: {

  ## Video
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = false;
    nvidiaSettings = true;

    #    package = config.boot.kernelPackages.nvidiaPackages.production;
    ### Driver Override example
    package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      version = "555.52.04";
      sha256_64bit = "sha256-nVOubb7zKulXhux9AruUTVBQwccFFuYGWrU1ZiakRAI=";
      openSha256 = "sha256-PMh5efbSEq7iqEMBr2+VGQYkBG73TGUh6FuDHZhmwHk=";
      settingsSha256 = "sha256-PMh5efbSEq7iqEMBr2+VGQYkBG73TGUh6FuDHZhmwHk=";
      persistencedSha256 = lib.fakeSha256;
    };
  };

  environment.variables = {
    ## Wayland NVIDIA Fixes
    WLR_NO_HARDWARE_CURSORS = "1";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
