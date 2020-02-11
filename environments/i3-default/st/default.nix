{ config, pkgs, lib, ... }:
let
  custom_st = pkgs.st.override {
    conf = builtins.readFile ./config.h;
    patches = let patch-scrollback = pkgs.fetchurl {
        url = "https://st.suckless.org/patches/scrollback/st-scrollback-0.8.2.diff";
        sha256 = "0rnigxkldl22dwl6b1743dza949w9j4p1akqvdxl74gi5z7fsnlw";
      };
      patch-scrollback-mouse = pkgs.fetchurl {
        url = "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-0.8.2.diff";
        sha256 = "1fm1b3yxk9ww2cz0dfm67l42a986ykih37pf5rkhfp9byr8ac0v1";
      };
    in [
      patch-scrollback
      patch-scrollback-mouse
    ];
  };
in {
  home.packages = [
    custom_st
  ];
  home.sessionVariables = {
    TERMINAL = "${custom_st}/bin/st";
  };
}
