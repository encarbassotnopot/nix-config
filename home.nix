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
      pkgs.nur.repos.forkprince.helium-nightly
      pkgs.yt-dlp
      pkgs.libreoffice
      pkgs.qbittorrent
      
      # desenvolupament
      pkgs.jetbrains.idea
      pkgs.devenv
      pkgs.opentofu
      pkgs.opentofu-ls

      # utilitats del sistema
      pkgs.unzip
      pkgs.jq
      pkgs.htop
      pkgs.gnome-tweaks
      pkgs.coppwr
      pkgs.usbutils
      pkgs.openssl

      # jocs
      pkgs.gamescope
      pkgs.protonplus
      # repacks de johncena141
      pkgs.bubblewrap
      pkgs.dwarfs
      pkgs.fuse-overlayfs
      pkgs.psmisc

      # nix
      pkgs.nil # lsp
      pkgs.nixfmt-rfc-style
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
    lutris.enable = true;

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
      "idea"
    ];
}
