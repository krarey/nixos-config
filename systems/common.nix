{ pkgs, ... }: {
  environment.localBinInPath = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = "America/New_York";
  nixpkgs.config.allowUnfree = true;

  security.pki.certificateFiles = [ ../files/home-root.pem ];

  users.users.kyle = {
    isNormalUser = true;
    description = "Kyle Rarey";
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIARgxhvXw0Pl1hPrimDE8YNcPpDhzelIMcTnMKBfHfZ/ kyle@opt.sh"
    ];
  };
}