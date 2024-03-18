{ config, pkgs, ... }:

{
  home.username = "lowkey";
  home.homeDirectory = "/home/lowkey";

  home.stateVersion = "23.11";

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.hello
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
#  ".config/qtile".source = /etc/nixos/modules/nixos/window-manager/qtile;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  
  programs = {
    #kitty = { 
    #  enable = true;
    #  theme = "Gruvbox Dark";
    #};
    #qutebrowser = {
    #  enable = true;
    #  extraConfig = 
    #  config.source('gruvbox.py')
    #};
  };
}
