{ pkgs, ... }: {
  environment.localBinInPath = true;
  users.users.kyle = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "changeme";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIARgxhvXw0Pl1hPrimDE8YNcPpDhzelIMcTnMKBfHfZ/ kyle@opt.sh"
    ];
  };
}