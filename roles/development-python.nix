{ config, pkgs, libs, ... }:
{
  imports = [
    ./development-base.nix
  ];
  programs.matplotlib = {
    enable = true;
    config = {
      backend = "gtk3agg";
    };
  };
  home.packages = with pkgs; [
    jetbrains.pycharm-professional
  ];
}
