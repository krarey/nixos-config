{ pkgs, ... }: {
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

  # Using fstrim.timer for now, until Linux 6.2.x enforces discard=async on btrfs by default
  # Mostly because I don't want to change mount options and the iops threshold sysctl
  services.fstrim.enable = true;

  # No touchy
  system.stateVersion = "23.11"; # Did you read the comment?
}

