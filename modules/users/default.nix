{ config, pkgs, ... }: {
  users.users.drembryo = {
    isNormalUser = true;
    description = "drembryo";
    extraGroups = [ "networkmanager" "wheel" "kvm"];
    packages = with pkgs; [
      # terminal
      alacritty
      kitty
      # browser 
      firefox
      # ds
      discord
      # app louncher
      rofi-wayland
      # utils
      curl
      zip
      killall
      flameshot
      bashmount
      neofetch
      unzip
      shellcheck
      multimarkdown
      ripgrep
      fd
      # file explorer
      xfce.thunar
      catppuccin-papirus-folders
      ranger
      feh
      # task bar
      waybar
      networkmanagerapplet
      cmus
      # wallpaper
      hyprpaper
      # widgets
      eww-wayland
      # media
      pavucontrol
      spotify
      cava
      vlc
      ffmpeg
      # code 
      git
      vscode
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "drembryo";
}