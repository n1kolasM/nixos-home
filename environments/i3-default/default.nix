{ config, pkgs, lib, ... }:
{
  imports = [
    ./dunst.nix
    ./i3.nix
    ./polybar.nix
    ./screen-locker.nix
    ./st
  ];
  dconf.enable = true;
  fonts.fontconfig.enable = true;
  gtk.enable = true;
  programs.firefox.enable = true;
  programs.rofi.enable = true;
  services.blueman-applet.enable = true;
  services.dunst.enable = true;
  services.network-manager-applet.enable = true;
  services.polybar.enable = true;
  services.random-background = {
    enable = true;
  };
  services.redshift = {
    enable = true;
    tray = true;
  };
  services.screen-locker.enable = true;
  services.udiskie.enable = true;

  xsession.enable = true;
  xsession.windowManager.i3.enable = true;
}
