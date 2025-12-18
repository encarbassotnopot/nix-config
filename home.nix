{ config, pkgs, ... }:

{
  home = {
    username = "eina";
    homeDirectory = "/home/eina";
    packages = [
      pkgs.htop
      pkgs.fortune
    ];
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "eina";
    userEmail = "eina@eina.cc";
  };
}
