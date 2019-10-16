{ nixpkgs ? import <nixpkgs> {}
}:

let nixCrate = nixpkgs.callPackage ./Cargo.nix {};
in nixCrate.rootCrate.build
