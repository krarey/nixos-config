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

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = "vivaldi-bin";
      mode = "0755";
    };
  };

  # Manage network-related services
  programs.ssh.startAgent = true;
  services.avahi.enable = true;

  # Manage hardware-related services
  services.fwupd.enable = true;
  services.fprintd.enable = true;
  # Using fstrim.timer for now, until Linux 6.2.x enforces discard=async on btrfs by default
  # Mostly because I don't want to change mount options and the iops threshold sysctl
  services.fstrim.enable = true;

  # Gaming hardware
  hardware.steam-hardware.enable = true;
  hardware.xpadneo.enable = true;
  
  # Manage application-related services
  services.flatpak.enable = true;
  virtualisation.podman.enable = true;

  # 1Password
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "kyle" ];
  };


  # No touchy
  system.stateVersion = "23.11"; # Did you read the comment?
}

