{config, pkgs, lib, inputs, modulesPath, ...}: {
  # enable CUPS to print documents.
  services.printing.enable = true;

  # sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  hardware.enableAllFirmware = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  
  # fonts
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [  
    nerdfonts
    font-awesome
    google-fonts
    font-awesome
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "Iosevka"  ]; })
  ];
  services.gollum.emoji = true;
}