{
  config,
  pkgs,
  nur,
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
      pkgs.ghostty
      pkgs.nur.repos.forkprince.helium-nightly
    ];
    stateVersion = "25.11";
  };

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      settings.user.name = "eina";
      settings.user.email = "eina@eina.cc";
    };
  };
}
