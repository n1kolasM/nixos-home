{ config, pkgs, libs, ... }:
let
  theme = import ../../themes/apprentice.nix;
in {
  xsession.windowManager.i3.config = {
    colors = {
      focused = {
        background = theme.color 4;
        border = theme.color 12;
        childBorder = theme.color 4;
        indicator = "#2e9ef4";
        text = theme.color 15;
      };
      focusedInactive = {
        background = theme.background;
        border = theme.color 7;
        childBorder = theme.color 7;
        indicator = "#2e9ef4";
        text = theme.color 15;
      };
      unfocused = {
        background = theme.background;
        border = theme.color 7;
        childBorder = theme.color 0;
        indicator = "#292d2e";
        text = theme.foreground;
      };
    };
    fonts = ["Fira Code 8"];
  };
  home.packages = with pkgs; [
    fira-code
  ];
}

