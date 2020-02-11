{ config, pkgs, lib, ... }:
{
  services.polybar = rec {
    package = pkgs.polybar.override {
      i3Support = true;
      pulseSupport = true;
    };
    config = {
      "bar/main" = {
        height = "2%";
        width = "100%";
        offset-x = "0%";
        offset-y = "0%";
        radius = 0;
        fixed-center = false;
        line-size = 2;
        line-color = "#f00";
        border-size = 0;
        padding-left = 0;
        padding-right = 0;
        module-margin-left = 1;
        module-margin-right = 2;
        font-0 = "Fira Code:size=12";
        font-1 = "unifont:size=12";
        font-2 = "Font Awesome 5 Free:style=Solid:size=12";
        modules-left = "i3";
        modules-right = "xbacklight pulseaudio memory cpu battery date xkeyboard";
        tray-position = "right";
        tray-padding = 2;
      };
      "module/i3" = {
        type = "internal/i3";
        format = "<label-state> <label-mode>";
        index-sort = true;
        label-mode-padding = 2;
        label-focused = "%index%";
        label-unfocused = "%index%";
        label-urgent = "%index%";
        label-focused-padding = 1;
        label-unfocused-padding = 1;
        label-urgent-padding = 1;
      };
      "module/pulseaudio" = {
        type = "internal/pulseaudio";
        use-ui-max = false;
        format-volume = "<ramp-volume> <label-volume> <bar-volume>";
        label-volume = "%percentage%%";
        interval = 2;
        label-muted = "";
        
        ramp-volume-0 = "";
        ramp-volume-1 = "";
        ramp-volume-2 = "";

        bar-volume-width = 10;
        bar-volume-indicator = "|";
        bar-volume-indicator-font = 2;
        bar-volume-fill = "─";
        bar-volume-fill-font = 2;
        bar-volume-empty = "─";
        bar-volume-empty-font = 2;
      };
      "module/memory" = {
        type = "internal/memory";
        interval = 2;
        format-prefix = " ";
        label = "%percentage_used%%";
      };
      "module/cpu" = {
        type = "internal/cpu";
        format-prefix = " ";
        label = "%percentage:2%%";
      };
      "module/battery" = {
        type = "internal/battery";
        format-charging = "<animation-charging> <label-charging>";
        format-discharging = "<animation-discharging> <label-discharging>";
        format-full-prefix = "";

        animation-charging-0 = "";
        animation-charging-1 = "";
        animation-charging-2 = "";
        animation-charging-3 = "";
        animation-charging-4 = "";
        animation-charging-5 = "";
        animation-charging-framerate = 750;

        animation-discharging-5 = "";
        animation-discharging-4 = "";
        animation-discharging-3 = "";
        animation-discharging-2 = "";
        animation-discharging-1 = "";
        animation-discharging-0 = "";
        animation-discharging-framerate = 750;
      };
      "module/date" = {
        type = "internal/date";
        interval = 5;
        date = "%d-%m-%y";
        time = "%H:%M";
        format-prefix = "";
        label = "%time% %date%";
      };
      "module/xkeyboard" = {
        type = "internal/xkeyboard";
        blacklist-0 = "num lock";
        format-prefix = " ";
        label-layout = "%layout%";
        label-indicator-padding = 2;
        label-indicator-margin = 1;
      };
    };
    script = "${package}/bin/polybar main &";
  };
  home.packages = with pkgs; [
    fira-code
    unifont
    font-awesome
  ];
}

