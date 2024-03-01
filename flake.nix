{
  description = "NixOS configuration for my home systems";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations = {
      framework = nixpkgs.lib.nixosSystem {
        inherit system pkgs;
        modules = [
          ./systems/common.nix
          ./systems/framework.nix
          ./systems/desktops/plasma-pipewire.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.kyle = import ./homes/kyle.nix;
          }
        ];
      };
    };
  };
}
