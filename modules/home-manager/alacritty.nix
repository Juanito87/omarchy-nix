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
        opacity = 0.95;
        decorations = "none";
      };

      font = {
        normal = {
          family = cfg.primary_font;
        };
        size = 12;
      };

      # ---- THEME: omarchy ----
      colors = {
        primary = {
          background = "#${palette.base00}";
          foreground = "#${palette.base05}";
        };

        selection = {
          background = "#${palette.base02}";
          text       = "#${palette.base00}";
        };

        # Alacritty splits the palette into normal/bright instead of a 0–21 list
        normal = {
          black   = "#${palette.base00}"; # 0
          red     = "#${palette.base08}"; # 1
          green   = "#${palette.base0B}"; # 2
          yellow  = "#${palette.base0A}"; # 3
          blue    = "#${palette.base0D}"; # 4
          magenta = "#${palette.base0E}"; # 5
          cyan    = "#${palette.base0C}"; # 6
          white   = "#${palette.base05}"; # 7
        };

        bright = {
          black   = "#${palette.base03}"; # 8
          red     = "#${palette.base08}"; # 9
          green   = "#${palette.base0B}"; # 10
          yellow  = "#${palette.base0A}"; # 11
          blue    = "#${palette.base0D}"; # 12
          magenta = "#${palette.base0E}"; # 13
          cyan    = "#${palette.base0C}"; # 14
          white   = "#${palette.base07}"; # 15
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

      keyboard.bindings = [
        {
          key = "K";
          mods = "Control";
          action = "ResetTerminal";
        }
      ];
    };
  };
}
