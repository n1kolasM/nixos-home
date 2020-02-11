{ config, pkgs, lib, ... }:
{
  services.screen-locker = {
    inactiveInterval = 5;
    lockCmd = "${pkgs.i3lock-fancy}/bin/i3lock-fancy -n";
    xautolockExtraOptions = [
      "-notify 30"
      "-notifier \"${pkgs.libnotify}/bin/notify-send -u critical -t 29000 -- 'LOCKING screen in 30 seconds'\""
    ];
  };
}

