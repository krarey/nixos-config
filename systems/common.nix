{ pkgs, ...}: {
  environment.localBinInPath = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = "America/New_York";

  security.pki.certificateFiles = [ ../files/home-root.pem ];

  programs.zsh.enable = true;

  programs.ssh.extraConfig = ''
    Host *
      StrictHostKeyChecking accept-new
  '';

  users.users.kyle = {
    isNormalUser = true;
    description = "Kyle Rarey";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIARgxhvXw0Pl1hPrimDE8YNcPpDhzelIMcTnMKBfHfZ/ kyle@opt.sh"
    ];
  };
}