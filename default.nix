{ nixpkgs ? import <unstable> {}
}:

let nixCrate = nixpkgs.callPackage ./Cargo.nix { pkgs = nixpkgs; };
in nixCrate.rootCrate.build
