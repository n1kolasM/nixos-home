{ config, pkgs, lib, ... }:
let
  colorTheme = import ../../themes/apprentice.nix;
in {
  services.dunst = {
    settings = {
      global = {
        font = "Fira Code 8";
      };
      frame = {
        color = "${colorTheme.color 9}";
      };
      urgency_low = {
        timeout = 4;
        foreground = "${colorTheme.foreground}";
        background = "${colorTheme.background}";
      };
      urgency_normal = {
        timeout = 8;
        foreground = "${colorTheme.foreground}";
        background = "${colorTheme.background}";
      };
      urgency_critical = {
        timeout = 0;
        foreground = "${colorTheme.foreground}";
        background = "${colorTheme.color 9}";
      };
    };
  };
  home.packages = with pkgs; [
    fira-code
  ];
}

