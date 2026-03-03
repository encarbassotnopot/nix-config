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
      nur.repos.forkprince.helium-nightly
      yt-dlp
      ffmpeg
      libreoffice
      qbittorrent
      signal-desktop
      keepassxc
      veracrypt
      bleachbit
      android-tools
      pangolin-cli
      mpv
      tor-browser
      gnome-feeds
      widevine-cdm
      age
      gcr
      gimp
      virtualbox

      # desenvolupament
      jetbrains.idea
      devenv
      opentofu
      tofu-ls
      qFlipper

      # utilitats del sistema
      unzip
      jq
      htop
      gnome-tweaks
      coppwr
      usbutils
      openssl
      desktop-file-utils

      # jocs
      gamescope
      protonplus

      # nix
      nil # lsp
      nixfmt
    ];
    stateVersion = "25.11";
  };

  xdg = {
    enable = true;
    userDirs.createDirectories = true;

    terminal-exec = {
      enable = true;
      settings = {
        default = [ "com.mitchellh.ghostty.desktop" ];
      };
    };
  };

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-curses;
  };

  programs = {
    home-manager.enable = true;
    ghostty.enable = true;
    zoxide.enable = true;
    fzf.enable = true;
    bat.enable = true;
    neovim.enable = true;
    lutris.enable = true;
    gpg.enable = true;
    direnv.enable = true;

    fish = {
      enable = true;
      preferAbbrs = true;
      shellAbbrs = {
        hm = "home-manager";
        gcl = "git clone";
      };
    };

    zed-editor = {
      enable = true;
      userSettings = {
        "disable_ai" = true;
        "title_bar" = {
          "show_sign_in" = false;
        };
      };
    };

    git = {
      enable = true;
      settings = {
        user.name = "eina";
        user.email = "eina@eina.cc";
        pull.rebase = true;
        gpg.format = "ssh";
        user.signingkey = "~/.ssh/id_ed25519.pub";
        commit.gpgsign = true;
        init.defaultBranch = "main";
      };
    };
  };

  nixpkgs.config.allowUnfreePredicate =
    pkgs:
    builtins.elem (lib.getName pkgs) [
      "idea"
      "veracrypt"
      "widevine-cdm"
    ];
}
