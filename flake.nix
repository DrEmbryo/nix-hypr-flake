{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, hyprland }:
  let
    lib = nixpkgs.lib;
    user = "drembryo";
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      ${user} = lib.nixosSystem {
        inherit system;
        modules = [ 
         ./modules/configuration.nix
	      hyprland.nixosModules.default
	      {
          programs.hyprland.enable = true;
          programs.hyprland.enableNvidiaPatches = true;
          programs.hyprland.xwayland.enable = true;
         } 
        ];
      };
    };
  };
}
