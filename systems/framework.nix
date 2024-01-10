{ config, lib, pkgs, ... }: {
  imports =[ ./hardware/framework.nix ];

  boot.loader.grub = {
    device = "nodev";
    efiSupport = true;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "framework";
  networking.networkmanager.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    wget
  ];

  programs.ssh.startAgent = true;

  services.fwupd.enable = true;
  services.fprintd.enable = true;
  services.flatpak.enable = true;

  # No touchy
  system.stateVersion = "23.11"; # Did you read the comment?
}

