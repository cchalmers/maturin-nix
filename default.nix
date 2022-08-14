{ nixpkgs ? import <nixpkgs> {}
}:

let nixCrate = import maturin-nix/Cargo.nix {
      pkgs = nixpkgs;
      defaultCrateOverrides = crateOverrides;
    };
    crateOverrides = nixpkgs.defaultCrateOverrides // {
      maturin-nix = old: {
        buildInputs = old.buildInputs or [] ++ [nixpkgs.darwin.Security];
      };
    };

in nixCrate.rootCrate.build
