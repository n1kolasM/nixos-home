{ config, pkgs, libs, ... }:
let
  dpi = "144";
in {
  xresources.properties."Xft.dpi" = dpi;
  services.polybar.config = {
    "bar/main" = {
      monitor = "eDP-1-1";
    };
    "module/battery" = {
      battery = "BAT0";
      adapter = "ADP0";
      full-at = 94; # Corrected to real charge
    };
  };
  xsession.windowManager.i3 = {
    config.startup = [
      {
        command = "${pkgs.xorg.xrandr}/bin/xrandr --dpi ${dpi}";
        notification = false;
      }
    ];
  };
}
