# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule
    inputs.nixvim.homeManagerModules.nixvim

    # You can also split up your configuration and import pieces of it here:
    ./alacritty.nix
    ./tmux.nix
    ./zsh.nix
    ./nixvim.nix
  ];


  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "kurtl";
    homeDirectory = "/home/kurtl";
  };

  home.packages = with pkgs; [
    neofetch
    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    direnv # auto source into dir (when 'cd'ing) w/o losing shell context
    fd # better 'find' utility
    ripgrep # recursively searches directories for a regex pattern
    #jq # A lightweight and flexible command-line JSON processor
    #yq-go # yaml processer https://github.com/mikefarah/yq
    eza # A modern replacement for 'ls
    #fzf # A command-line fuzzy finder

    # networking tools
    #mtr # A network diagnostic tool
    #iperf3
    #dnsutils  # `dig` + `nslookup`
    #ldns # replacement of `dig`, it provide the command `drill`
    #aria2 # A lightweight multi-protocol & multi-source command-line download utility
    #socat # replacement of openbsd-netcat
    #nmap # A utility for network discovery and security auditing
    #ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    #file
    #which
    tree
    #gnused
    #gnutar
    #gawk
    #zstd
    #gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix
    # with more details log output
    nix-output-monitor

    # productivity
    #hugo # static site generator
    #glow # markdown previewer in terminal
    tmux # terminal multiplexer

    #btop  # replacement of htop/nmon
    #iotop # io monitoring
    #iftop # network monitoring

    # system call monitoring
    #strace # system call monitoring
    #ltrace # library call monitoring
    #lsof # list open files

    # system tools
    #sysstat
    #lm_sensors # for `sensors` command
    #ethtool
    #pciutils # lspci
    #usbutils # lsusb
    fswatch
  ];

  # enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # enable direnv
  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    zsh.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
