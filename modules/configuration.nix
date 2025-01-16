{ config, pkgs, lib, inputs, modulesPath, ... }: {

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./bootloader/grub.nix
      ./gui/hyprland.nix
      ./peripherals
      ./network
      ./i18n
      ./ssh
      ./users
    ];


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # system packages
  environment.systemPackages = with pkgs; [
    wget
    git
    kitty
  ];

  # system features
  system.stateVersion = "24.05"; 
}
