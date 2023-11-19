{config, pkgs, lib, inputs, modulesPath, ...}: {
  # reymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # nvidia driver for Xorg and Wayland
  services.xserver = {
    videoDrivers = ["nvidia"];
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  # hardware config
  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };
  
  # xdg portals config
  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  # enabling hyprlnd on NixOS
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1"; # fix missing coursor
    NIXOS_OZONE_WL = "1"; # fix electron apps 
  };
  
  # overlays
  nixpkgs = {
    # enable waybar 
    overlays = [
      (self: super: {
        waybar = super.waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true" "-Dmpd=enabled"];
        });
      })
    ];
  };
}