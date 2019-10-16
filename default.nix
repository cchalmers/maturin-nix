{ nixpkgs ? import <nixpkgs> {}
}:

nixpkgs.callPackage ./maturin-nix.nix {}
