{ config, pkgs, ... }: {
  users.users.drembryo = {
    isNormalUser = true;
    description = "drembryo";
    extraGroups = [ "networkmanager" "wheel" "kvm"];
    packages = with pkgs; [
      alacritty
      firefox
      discord
      firefox
      kitty
      swww
      rofi-wayland
      flameshot
      mako
      firefox
      discord
      curl
      bashmount
      xfce.thunar
      networkmanagerapplet
      catppuccin-papirus-folders
      neofetch
      ranger
      feh
      waybar
      cmus
      hyprpaper
      zip
      ripgrep
      fd
      unzip
      cava
      git
      pavucontrol
      multimarkdown
      shellcheck
      vlc
      ffmpeg
      spotify
      killall
      vscode
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "drembryo";
}