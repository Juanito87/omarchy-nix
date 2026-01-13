{
  config,
  pkgs,
  ...
}:

let
  cfg = config.omarchy;
  palette = config.colorScheme.palette;
in
{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        padding = {
          x = 14;
          y = 14;
        };

        decorations = "none";

        # NEW
        dynamic_title = true;
        opacity = 0.75;
        startup_mode = "Windowed";
        title = "Juanito's Alacritty";
      };

      scrolling.history = 15000;

      font = {
        size = 12.0;

        normal = {
          family = cfg.primary_font;
          style = "Regular";
        };
      };

      # ------- CUSTOM COLORS -------
      colors = {
        primary = {
          background = "#${palette.base00}";
          foreground = "#${palette.base05}";
        };

        selection = {
          background = "#${palette.base02}";
          text       = "#${palette.base00}";
        };

        # NEW: vi-mode cursor
        vi_mode_cursor = {
          cursor = "CellForeground";
          text   = "CellBackground";
        };

        normal = {
          black   = "#${palette.base00}";
          red     = "#${palette.base08}";
          green   = "#${palette.base0B}";
          yellow  = "#${palette.base0A}";
          blue    = "#${palette.base0D}";
          magenta = "#${palette.base0E}";
          cyan    = "#${palette.base0C}";
          white   = "#${palette.base05}";
        };

        bright = {
          black   = "#${palette.base03}";
          red     = "#${palette.base08}";
          green   = "#${palette.base0B}";
          yellow  = "#${palette.base0A}";
          blue    = "#${palette.base0D}";
          magenta = "#${palette.base0E}";
          cyan    = "#${palette.base0C}";
          white   = "#${palette.base07}";
        };

        indexed_colors = [
          { index = 16; color = "#${palette.base09}"; }
          { index = 17; color = "#${palette.base0F}"; }
          { index = 18; color = "#${palette.base01}"; }
          { index = 19; color = "#${palette.base02}"; }
          { index = 20; color = "#${palette.base04}"; }
          { index = 21; color = "#${palette.base06}"; }
        ];
      };
    };
  };
}
