{ pkgs, unstable, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "kyle";
  home.homeDirectory = "/home/kyle";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Kyle Rarey";
    userEmail = "kyle.rarey@gmail.com";
  };
  
  home.packages = [
    unstable.nomad_1_7
    unstable.vault
    unstable.consul
    unstable.terraform
    pkgs.firefox
    pkgs._1password
    pkgs.vscode.fhs
  ];
}