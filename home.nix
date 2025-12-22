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
      pkgs.nixfmt-rfc-style
      pkgs.nur.repos.forkprince.helium-nightly
      pkgs.unzip
      pkgs.jq
    ];
    sessionVariables = {
      EDITOR = "nvim";
    };
    stateVersion = "25.11";
  };

  xdg.userDirs.createDirectories = true;

  services.spotifyd.enable = true;

  programs = {
    home-manager.enable = true;
    ghostty.enable = true;
    vscode.enable = true;
    zoxide.enable = true;
    fish.enable = true;
    fish.preferAbbrs = true;
    fzf.enable = true;
    bat.enable = true;
    neovim.enable = true;

    git = {
      enable = true;
      settings = {
        user.name = "eina";
        user.email = "eina@eina.cc";
        pull.rebase = true;
        gpg.format = "ssh";
        user.signingkey = "~/.ssh/id_ed25519.pub";
	commit.gpgsign = true;
      };
    };
  };

  nixpkgs.config.allowUnfreePredicate =
    pkgs:
    builtins.elem (lib.getName pkgs) [
      "vscode"
    ];
}
