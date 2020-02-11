{ config, pkgs, libs, ... }:
{
  imports = [
    ./machines/laptop-alpha

    ./environments/i3-default

    ./users/n1kolasm

    ./roles/development-base.nix
    ./roles/development-c.nix
    ./roles/development-python.nix
    ./roles/development-nix.nix
    ./roles/office.nix
  ];
  programs.home-manager.enable = true;
  nixpkgs.config = import ./nixpkgs-config.nix;
  xdg.configFile."nixpkgs/config.nix".source = ./nixpkgs-config.nix;
  home.stateVersion = "18.09";
}
