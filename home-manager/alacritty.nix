{ pkgs, ...}:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 14;
        draw_bold_text_with_bright_colors = true;
	normal = {
	  #family = "MesloLGS NF";
	  #family = "Liberation Mono";
	  #family = "Source Sans 3"; # although spacing is borked
	  #family = "Iosevka";
	  family = "Iosevka Comfy Wide Motion";
	  style = "Regular";
	};
	bold = {
	  family = "Iosevka Comfy Wide Motion";
	  style = "Bold";
	};
	italic = {
	  family = "Iosevka Comfy Wide Motion";
	  style = "Italic";
	};
	bold_italic = {
	  family = "Iosevka Comfy Wide Motion";
	  style = "Bold Italic";
	};
      };
      window = {
        dimensions = {
          columns = 208;
          lines = 48;
        };
        padding = {
          x = 5;
          y = 5;
        };
        decorations = "none";
        startup_mode = "Windowed";
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      shell = {
        program = "${pkgs.zsh}/bin/zsh";
      };

      colors = {
        theme = "zenbones-light";
       	primary = {
          background = "#F0EDEC";
          foreground = "#2C363C";
        };
        cursor = {
          text = "#F0EDEC";
          cursor = "#2C363C";
        };
        normal = {
          black = "#F0EDEC";
          red = "#A8334C";
          green = "#4F6C31";
          yellow = "#944927";
          blue = "#286486";
          magenta = "#88507D";
          cyan = "#3B8992";
          white = "#2C363C";
        };
        bright = {
          black = "#CFC1BA";
          red = "#94253E";
          green = "#3F5A22";
          yellow = "#803D1C";
          blue = "#1D5573";
          magenta = "#7B3B70";
          cyan = "#2B747C";
          white = "#4F5E68";
        };
      };

      #colors = {
      #  theme = "catppuccin-macchiato";
      #  primary = {
      #    background = "#24273A";
      #    foreground = "#CAD3F5";
      #    dim_foreground = "#CAD3F5";
      #    bright_foreground = "#CAD3F5";
      #  };
      #  cursor = {
      #    text = "#24273A";
      #    cursor = "#F4DBD6";         
      #  };
      #  vi_mode_cursor = {
      #    text = "#24273A";
      #    cursor = "#B7BDF8";
      #  };
      #  search = {
      #    matches = {
      #      foreground = "#24273A";
      #      background = "#A5ADCB";
      #    };
      #    focused_match = {
      #      foreground = "#24273A";
      #      background = "#A6DA95";
      #    };
      #  };
      #  footer_bar = {
      #    foreground = "#24273A";
      #    background = "#A5ADCB";
      #  };
      #  hints = {
      #    start = {
      #      foreground = "#24273A";
      #      background = "#EED49F";
      #    };
      #    end = {
      #      foreground = "#24273A";
      #      background = "#A5ADCB";
      #    };
      #  };
      #  selection = {
      #    text = "#24273A";
      #    background = "#F4DBD6";
      #  };
      #  normal = {
      #    black = "#494D64";
      #    red = "#ED8796";
      #    green = "#A6DA95";
      #    yellow = "#EED49F";
      #    blue = "#8AADF4";
      #    magenta = "#F5BDE6";
      #    cyan = "#8BD5CA";
      #    white = "#B8C0E0";
      #  };
      #  bright = {
      #    black = "#5B6078";
      #    red = "#ED8796";
      #    green = "#A6DA95";
      #    yellow = "#EED49F";
      #    blue = "#8AADF4";
      #    magenta = "#F5BDE6";
      #    cyan = "#8BD5CA";
      #    white = "#A5ADCB";
      #  };
      #  dim = {
      #    black = "#494D64";
      #    red = "#ED8796";
      #    green = "#A6DA95";
      #    yellow = "#EED49F";
      #    blue = "#8AADF4";
      #    magenta = "#F5BDE6";
      #    cyan = "#8BD5CA";
      #    white = "#B8C0E0";
      #  };
      #  indexed_colors = [
      #    { index = 16; color = "#F5A97F"; }
      #    { index = 17; color = "#F4DBD6"; }
      #  ];
      #};
    };
  };
}
