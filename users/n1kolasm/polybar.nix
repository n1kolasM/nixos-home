{ config, pkgs, lib, ... }:
let
  colorTheme = import ../../themes/apprentice.nix;
in {
  services.polybar = rec {
    config = {
      "bar/main" = {
        background = "${colorTheme.background}";
        foreground = "${colorTheme.foreground}";
        tray-background = "${colorTheme.background}";
      };
      "module/i3" = {
        label-mode-foreground = "#000";
        label-mode-background = "${colorTheme.color 11}";
        label-focused-background = "${colorTheme.color 7}";
        label-focused-underline = "${colorTheme.color 11}";
        label-urgent-background = "${colorTheme.color 9}";
      };
      "module/pulseaudio" = {
        label-muted-foreground = "${colorTheme.color 8}";
        bar-volume-foreground-0 = "${colorTheme.color 2}";
        bar-volume-foreground-1 = "${colorTheme.color 2}";
        bar-volume-foreground-2 = "${colorTheme.color 2}";
        bar-volume-foreground-3 = "${colorTheme.color 2}";
        bar-volume-foreground-4 = "${colorTheme.color 2}";
        bar-volume-foreground-5 = "${colorTheme.color 9}";
        bar-volume-foreground-6 = "${colorTheme.color 9}";
        bar-volume-gradient = true;
        bar-volume-empty-foreground = "${colorTheme.background}";
      };
      "module/memory" = {
        format-prefix-foreground = "${colorTheme.foreground}";
        format-underline = "${colorTheme.color 14}";
      };
      "module/cpu" = {
        format-prefix-foreground = "${colorTheme.foreground}";
        format-underline = "${colorTheme.color 13}";
      };
      "module/battery" = {
        format-charging = "<animation-charging> <label-charging>";
        format-charging-underline = "${colorTheme.color 9}";
        format-discharging-underline = "\${self.format-charging-underline}";
        format-full-prefix-foreground = "${colorTheme.foreground}";
        format-full-underline = "\${self.format-charging-underline}";
        animation-charging-foreground = "${colorTheme.foreground}";
        animation-discharging-foreground = "${colorTheme.foreground}";
      };
      "module/date" = {
        format-prefix-foreground = "${colorTheme.foreground}";
        format-underline = "${colorTheme.color 12}";
      };
      "module/xkeyboard" = {
        format-prefix-foreground = "${colorTheme.foreground}";
        format-prefix-underline = "${colorTheme.color 13}";
        label-layout-underline = "${colorTheme.color 13}";
        label-indicator-background = "${colorTheme.color 1}";
        label-indicator-underline = "${colorTheme.color 1}";
      };
    };
  };
}
