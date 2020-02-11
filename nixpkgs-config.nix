{
  imports = [ /etc/nixos/cachix.nix ];
  allowUnfree = true;
  packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball {
      url = "https://github.com/nix-community/NUR/archive/951bdeac7dd06de7c412fa29f198ad8bead31891.tar.gz";
      sha256 = "1marw5ykkfbklyqz1i722p7qbzdrp2dp7n4gkk7xx5va3g53k2yk";
    }) { inherit pkgs; };
  };
}
