{
  description = "NixOS configuration for my home systems";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    unstable = import nixpkgs-unstable { 
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations = {
      hyper-v = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./systems/common.nix
          ./systems/hyper-v.nix
          ./systems/desktops/plasma5-pipewire.nix
        ];
      };
      framework = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./systems/common.nix
          ./systems/framework.nix
          ./systems/desktops/plasma5-pipewire.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit unstable; };
            home-manager.users.kyle = import ./homes/kyle.nix;
          }
        ];
      };
    };
  };
}