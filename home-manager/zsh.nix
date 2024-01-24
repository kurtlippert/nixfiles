{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;

    shellAliases = {
      # better utils
      ls = "eza";

      # shell reload
      hmr = "home-manager switch --flake /etc/nixos/#kurtl@nixl; source ~/.zshrc; tmux source ~/.config/tmux/tmux.conf";
      tmxr = "tmux source ~/.tmux.conf";
      nixr = "sudo nixos-rebuild switch --option eval-cache false";

      # common config files
      nvimc = "sudo -E nvim /etc/nixos/configuration.nix";
      nvimf = "sudo -E nvim /etc/nixos/flake.nix";
      nvimh = "sudo -E nvim /etc/nixos/home-manager/home.nix";
      nvimz = "sudo -E nvim /etc/nixos/home-manager/zsh.nix";
      nvima = "sudo -E nvim /etc/nixos/home-manager/alacritty.nix";
      nvimn = "sudo -E nvim /etc/nixos/home-manager/nixvim.nix";
      nvimt = "sudo -E nvim /etc/nixos/home-manager/tmux.nix";
    };

    # just to add the various git-related shell aliases
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.5.0";
          sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
        };
      }
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    localVariables = {
      POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true;
    };
    initExtra = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

      # exit tmux alias
      function tmxe() { tmux kill-server; }
    '';
  };
}
