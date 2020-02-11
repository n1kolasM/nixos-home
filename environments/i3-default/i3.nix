{ config, pkgs, lib, ... }:
{
  xsession.windowManager.i3 = {
    config = rec {
      startup = [
        {
          command = "${pkgs.systemd}/bin/systemctl --user restart polybar";
          always = true;
          notification = false;
        }
      ];
      assigns = {
        "1" = [{ class = "Firefox"; }];
        "2" = [{ class = "^jetbrains"; }];
        "3" = [{ class = "^TelegramDesktop$"; }];
      };
      modifier = "Mod4";
      bars = [];
      keybindings = lib.mkOptionDefault {
        "${modifier}+F2" = "exec --no-startup-id ${pkgs.i3}/bin/i3-dmenu-desktop --dmenu='rofi -dmenu'";
        "${modifier}+F4" = "exec --no-startup-id ${pkgs.rofi-pass}/bin/rofi-pass";
        "XF86AudioMute" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-mute 0 toggle";
        "XF86AudioLowerVolume" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-volume 0 -5%";
        "XF86AudioRaiseVolume" = "exec --no-startup-id ${pkgs.pulseaudio}/bin/pactl set-sink-volume 0 +5%";
      };
    };
  };
  home.sessionVariables = {
    TERMINAL = "st";
  };
}

