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
      (tor-browser.override {
        extraPrefs = ''
          mkdir -p "$TBB_IN_STORE/TorBrowser/Data/Browser/.mozilla/native-messaging-hosts/"
          ln -s "$out/lib/mozilla/native-messaging-hosts/org.keepassxc.keepassxc_browser.json" "$TBB_IN_STORE/TorBrowser/Data/Browser/.mozilla/native-messaging-hosts/org.keepassxc.keepassxc_browser.json"
        '';
      })

      # desenvolupament
      jetbrains.idea
      devenv
      opentofu
      tofu-ls

      # utilitats del sistema
      unzip
      jq
      htop
      gnome-tweaks
      coppwr
      usbutils
      openssl

      # jocs
      gamescope
      protonplus
      # repacks de johncena141
      bubblewrap
      dwarfs
      fuse-overlayfs
      psmisc

      # nix
      nil # lsp
      nixfmt
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
        init.defaultBranch = "main";
      };
    };
  };

  nixpkgs.config.allowUnfreePredicate =
    pkgs:
    builtins.elem (lib.getName pkgs) [
      "vscode"
      "idea"
      "veracrypt"
    ];
}
