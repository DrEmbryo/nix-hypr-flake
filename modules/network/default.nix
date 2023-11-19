{config, pkgs, lib, inputs, modulesPath, ... }: {

  networking.hostName = "nixos"; 

  # Enable networking
  networking.networkmanager.enable = true;

  # firewall
  # networking.firewall.enable = true;
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];


  # wireless networks
  # networking.wireless.enable = true; 

  # network proxy
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
}