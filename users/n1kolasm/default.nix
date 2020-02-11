{ config, pkgs, lib, ... }:
let
  gpgKeyId = "4AE29B0A5A82E71F3CA83ACA661A68D7A29CCFBB";
in {
  imports = [
    ./dunst.nix
    ./i3.nix
    ./polybar.nix
  ];
  programs.git = {
    userName = "Nikolay Marchuk";
    userEmail = "marchuk.nikolay.a@gmail.com";
    signing.key = gpgKeyId; 
    signing.signByDefault = true;
    extraConfig = {
      core.editor = "${config.programs.neovim.finalPackage}/bin/nvim";
      credential.helper = "store --file ~/.my-credentials"; 
    };
  };

  xsession = {
    pointerCursor = {
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 24;
    };
    windowManager.i3.config = {
      fonts = ["Fira Code 8"];
    };
  };
  gtk = {
    theme = {
      package = pkgs.gnome3.gnome_themes_standard;
      name = "Adwaita";
    };
    iconTheme = {
      package = pkgs.gnome3.adwaita-icon-theme;
      name = "Adwaita";
    };
  };
  services.redshift = {
    latitude = "55.0";
    longitude = "82.9";
    brightness = {
      day = "1";
      night = "0.75";
    };
  };
  services.random-background.imageDirectory = "%h/backgrounds";
  fonts.fontconfig.enable = true;
  programs.neovim.extraConfig = ''
    color apprentice
    set termguicolors
  '';
  home.file.".config/nvim/ginit.vim".text=''
    if exists('g:GtkGuiLoaded')
      call rpcnotify(1, 'Gui', 'Font', 'Fira Code Regular 15')
    endif  
  '';
  home.packages = with pkgs; [
    fira-code
    tdesktop
  ];
  home.keyboard = {
    layout = "us,ru";
    options = [ "grp:alt_shift_toggle" ];
  };
  home.language = {
    base = "ru_RU.UTF-8";
  };
  home.sessionVariables = {
    LC_MESSAGES = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
  };
}
