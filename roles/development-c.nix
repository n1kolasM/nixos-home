{ config, pkgs, lib, ... }:
{
  programs.neovim = {
    extraConfig = ''
      au FileType c set noexpandtab
    '';
  };
}
