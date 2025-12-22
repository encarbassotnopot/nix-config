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
      pkgs.zoxide
    ];
    stateVersion = "25.11";
  };

  xdg.userDirs.createDirectories = true;
  programs = {
    home-manager.enable = true;
    ghostty.enable = true;
    ghostty.enableFishIntegration = true;
    vscode.enable = true;
    zoxide.enable = true;
    zoxide.enableFishIntegration = true;

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
