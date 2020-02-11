{ config, pkgs, lib, ... }:
{
  imports = [
    ./development-base.nix
  ];
  programs.neovim = {
    extraConfig = ''
      au FileType c set noexpandtab
    '';
  };
}
