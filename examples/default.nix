{ nixpkgs ? import <nixpkgs> {}
}:

# Lots of issues with this example helper:
#  - python version needs to match what the crate was built with
#  - doesn't seem to work with abi stuff from the abi-py37 feature
#  - doesn't get link info from .cargo/config.toml

# Some extra features I want:
#  - cross compiling
#  - distributable wheels (probably via zig cc)

let nixCrate = import ./Cargo.nix {
      pkgs = nixpkgs;
      defaultCrateOverrides = crateOverrides;
    };
    crateOverrides = nixpkgs.defaultCrateOverrides // {
      maturin-nix = old: {
        buildInputs = old.buildInputs or [] ++ [ nixpkgs.darwin.Security ];
      };
      pyo3-build-config = old: {
        buildInputs = old.buildInputs or [] ++ [ nixpkgs.python3 ];
      };
      mmpy = old: {
        buildInputs = old.buildInputs or [] ++ [ nixpkgs.python3 ];
        extraLinkFlags = [ "-C link-arg=-undefined" "-C link-arg=dynamic_lookup" ];
      };
    };

    maturin-nix = import ../. { inherit nixpkgs; };
    mkPyo3Wheel = { python, crateLib, moduleName, deps ? [] }: nixpkgs.stdenv.mkDerivation {
      pname = moduleName;
      version = crateLib.version;
      inherit moduleName;
      outputs = [ "out" "wheel" ];
      dontUnpack = true;
      nativeBuildInputs = [ python maturin-nix python.pkgs.pipInstallHook nixpkgs.rustc ];
      # deps should takes packages arg probably?
      propagatedBuildInputs = [ python ] ++ deps;
      canonicalLibName = nixpkgs.lib.replaceStrings ["-"] ["_"] crateLib.libName;
      crateLib = crateLib;
      manifestPath = "${crateLib.src}/Cargo.toml";
      buildPhase = ''
        artifact_path=$(echo $crateLib/lib/lib$canonicalLibName.*)
        if [[ -z $artifact_path ]]; then
          >&2 echo -e "\e[1;31merror:\e[0m no lib$canonicalLibName in $crateLib/lib:"
          >&2 echo "ls $crateLib/lib":
          >&2 ls "$crateLib/lib"
          exit 1
        fi

        mkdir -p dist
        maturin-nix build \
          --manifest-path "$manifestPath" \
          --module-name "$moduleName" \
          --artifact-path "$artifact_path" \
          --output-dir dist
      '';
      postInstall = "mv dist $wheel";
    };

# in nixCrate.rootCrate.build
in mkPyo3Wheel {
  python = nixpkgs.python3;
  moduleName = "mmpy";
  crateLib = nixCrate.workspaceMembers.mmpy.build.lib;
  deps = [ nixpkgs.python3Packages.numpy ];
}
