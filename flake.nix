{
  description = "NixOS configuration for my home systems";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      hyper-v = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/common.nix
          ./systems/hyper-v.nix
          ./systems/desktops/plasma5-pipewire.nix
        ];
      };
      framework = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./systems/common.nix
          ./systems/framework.nix
          ./systems/desktops/plasma5-pipewire.nix
        ];
      };
    };
  };
}