{ nixpkgs ? import <unstable> {}
}:

let nixCrate = nixpkgs.callPackage ./Cargo.nix { pkgs = nixpkgs; };
    crateOverrides = nixpkgs.defaultCrateOverrides // {
      maturin-nix = old: {
        buildInputs = old.buildInputs or [] ++ [nixpkgs.darwin.Security];
      };
    };

in nixCrate.rootCrate.build.override { inherit crateOverrides; }
