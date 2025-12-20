{
  config,
  pkgs,
  lib,
  ...
}:

{
  home = {
    username = "eina";
    homeDirectory = "/home/eina";
    packages = with pkgs; [
      pkgs.htop
      pkgs.fortune
      pkgs.nixfmt-rfc-style
      pkgs.nur.repos.forkprince.helium-nightly
    ];
    stateVersion = "25.11";
  };

  programs = {
    home-manager.enable = true;
    ghostty.enable = true;
    ghostty.enableFishIntegration = true;
    vscode.enable = true;

    fish.preferAbbrs = true;
    git = {
      enable = true;
      settings.user.name = "eina";
      settings.user.email = "eina@eina.cc";
    };
  };

  nixpkgs.config.allowUnfreePredicate =
    pkgs:
    builtins.elem (lib.getName pkgs) [
      "vscode"
    ];
}
