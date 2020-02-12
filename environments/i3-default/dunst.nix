{ config, pkgs, lib, ... }:
{
  services.dunst = {
    settings = {
      global = {
        geometry = "300x80-30-20";
        padding = 32;
        horizontal_padding = 30;
        line_height = 4;
        markup = "full";
        alignment = "left";
        word_wrap = "true";
      };
      frame = {
        width = 2;
      };
    };
  };
}

