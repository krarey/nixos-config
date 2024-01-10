{ pkgs, ... }: {
  environment.localBinInPath = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = "America/New_York";
  nixpkgs.config.allowUnfree = true;
  users.users.kyle = {
    isNormalUser = true;
    description = "Kyle Rarey";
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIARgxhvXw0Pl1hPrimDE8YNcPpDhzelIMcTnMKBfHfZ/ kyle@opt.sh"
    ];
    packages = with pkgs; [
      firefox
      _1password
      vscode.fhs
    ];
  };
}