{
  imports = [ /etc/nixos/cachix.nix ];
  allowUnfree = true;
  packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball {
      url = "https://github.com/nix-community/NUR/archive/f32fcb62133b2b51e981e95102a6eca22b9f2715.tar.gz";
      sha256 = "1m4zvzahi88w9rk9rfx7rxfz0psm62d3pyrknk6ahsrvccjrs56x";
    }) { inherit pkgs; };
  };
}
