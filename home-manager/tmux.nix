{ pkgs, ... }: 
{
  programs.tmux = {
    enable = true;
    # shortcut = "a";
    shell = "${pkgs.zsh}/bin/zsh";
    # aggressiveResize = true; -- Disabled to be iTerm-friendly
    baseIndex = 1;
    newSession = true;
    # Stop tmux+escape craziness.
    escapeTime = 0;
    # Force tmux to use /tmp for sockets (WSL2 compat)
    secureSocket = false;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.nord
    ];

    extraConfig = ''
      # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"

      # to accomodate the alacritty zenbones theme
      set -g window-style 'fg=#2C363C,bg=#F0EDEC'
      set -g message-style 'bg=#CFC1BA'
      set -g mode-style 'bg=#CFC1BA'

      #primary = {
      #    background = "#F0EDEC";
      #    foreground = "#2C363C";
      #  };
      #  cursor = {
      #    text = "#F0EDEC";
      #    cursor = "#2C363C";
      #  };
      #  normal = {
      #    black = "#F0EDEC";
      #    red = "#A8334C";
      #    green = "#4F6C31";
      #    yellow = "#944927";
      #    blue = "#286486";
      #    magenta = "#88507D";
      #    cyan = "#3B8992";
      #    white = "#2C363C";
      #  };
      #  bright = {
      #    black = "#CFC1BA";
      #    red = "#94253E";
      #    green = "#3F5A22";
      #    yellow = "#803D1C";
      #    blue = "#1D5573";
      #    magenta = "#7B3B70";
      #    cyan = "#2B747C";
      #    white = "#4F5E68";

      # remap prefix from 'C-b' to 'M-f'
      unbind C-a
      set-option -g prefix M-f
      bind-key M-f send-prefix

      # Mouse works as expected
      set-option -g mouse on
      # easy-to-remember split pane commands
      # bind | split-window -h -c "#{pane_current_path}"
      # bind - split-window -v -c "#{pane_current_path}"
      # bind c new-window -c "#{pane_current_path}"

      # switch panes using Alt-arrow without prefix
      # bind -n M-Left select-pane -L
      # bind -n M-Right select-pane -R
      # bind -n M-Up select-pane -U
      # bind -n M-Down select-pane -D

      # resize panes using alt-<vim_keys> without prefix
      # bind -n M-h resize-pane -L 5
      # bind -n M-l resize-pane -R 5
      # bind -n M-k resize-pane -U 5
      # bind -n M-j resize-pane -D 5

      # switch panes using alt-<vim_mov_keys> without prefix
      bind -n M-h select-pane -L
      bind -n M-l select-pane -R
      bind -n M-k select-pane -U
      bind -n M-j select-pane -D

      # resize panes using alt-L_Shift-<vim_mov_keys> without prefix
      bind -n M-H resize-pane -L 5
      bind -n M-L resize-pane -R 5
      bind -n M-K resize-pane -U 5
      bind -n M-J resize-pane -D 5
    '';
  };
}
