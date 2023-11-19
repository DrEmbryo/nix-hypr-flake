{ config, pkgs, ... }: {
  # Grub config
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "intel_pstate=active" ];
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
  };
}