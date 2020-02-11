{ config, pkgs, lib, ... }:
{
  imports = [
    ./development-base.nix
  ];
  programs.neovim.plugins = [
    pkgs.vimPlugins.vim-nix
  ];
  home.packages = with pkgs; [
    nix-prefetch-github
  ];
}
