rec {
  foreground = "#bcbcbc";
  background = "#262626";
  colors = [
    "#1c1c1c"
    "#af5f5f"
    "#5f875f"
    "#87875f"
    "#5f87af"
    "#5f5f87"
    "#5f8787"
    "#6c6c6c"
    "#444444"
    "#ff8700"
    "#87af87"
    "#ffffaf"
    "#8fafd7"
    "#8787af"
    "#5fafaf"
    "#ffffff"
  ];
  color = c: builtins.elemAt colors c;
}
