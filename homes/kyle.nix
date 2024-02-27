{ pkgs, unstable, ... }:
let
  sessionVariables = {
    NOMAD_ADDR = "https://nomad.service.consul:4646";
    VAULT_ADDR = "https://vault.service.consul:8200";
    CONSUL_HTTP_ADDR = "https://consul.service.consul:8501";
  };
in
{
  home.username = "kyle";
  home.homeDirectory = "/home/kyle";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Kyle Rarey";
    userEmail = "kyle.rarey@gmail.com";
  };

  programs.bash = {
    inherit sessionVariables;
    enable = true;
  };

  programs.zsh = {
    inherit sessionVariables;
    enable = true;
  };

  programs.starship.enable = true;
  programs.fzf.enable = true;

  programs.vim = {
    enable = true;
    defaultEditor = true;
  };

  home.packages = [
    unstable.nomad_1_7
    unstable.vault
    unstable.consul
    unstable.terraform
    pkgs.firefox
    pkgs.vscode.fhs
    pkgs.vivaldi
    pkgs.kind
    pkgs.kubectl
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";
}