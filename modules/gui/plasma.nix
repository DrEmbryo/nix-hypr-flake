{config, pkgs, lib, inputs, modulesPath, ...}: {
  # KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
}