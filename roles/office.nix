{ config, pkgs, libs, ... }:
{
  programs.zathura.enable = true;
  home.packages = with pkgs; [
    libreoffice
    gnucash
    gnome3.eog
  ];
}
