# Custom fork to allow making a wheel from an already compiled .so file.
# Pull request pending.
{ stdenv, fetchFromGitHub, rustPlatform, dbus, gmp, openssl, pkgconfig
, darwin, lib }:

let
  inherit (darwin.apple_sdk.frameworks) Security;
  sourceFilter = name: type:
  let baseName = builtins.baseNameOf (builtins.toString name);
  in ! (
    # Filter out git
    baseName == ".gitignore" ||
    (type == "directory" && baseName == ".git" ) ||

    # Filter out build results
    (type == "directory" && (
      baseName == "target" ||
      baseName == "_site" ||
      baseName == ".sass-cache" ||
      baseName == ".jekyll-metadata" ||
      baseName == "build-artifacts"
      )) ||

    # Filter out nix-build result symlinks
    (type == "symlink" && lib.hasPrefix "result" baseName) ||

    # Filter out IDE config
    (type == "directory" && (
      baseName == ".idea" ||
      baseName == ".vscode"
      )) ||
    lib.hasSuffix ".iml" baseName ||

    # Filter out nix build files
    # lib.hasSuffix ".nix" baseName ||

    # Filter out editor backup / swap files.
    lib.hasSuffix "~" baseName ||
    builtins.match "^\\.sw[a-z]$$" baseName != null ||
    builtins.match "^\\..*\\.sw[a-z]$$" baseName != null ||
    lib.hasSuffix ".tmp" baseName ||
    lib.hasSuffix ".bak" baseName ||
    baseName == "tests.nix"
  );

in rustPlatform.buildRustPackage rec {
  name = "maturin-nix-${version}";
  version = "0.1.0";

  src = builtins.filterSource sourceFilter ./.;

  cargoSha256 = "1yf9v50cl2w3xka7y2nvg9vb6nk3vb0pazss8rlv5bjxipv0672a";

  nativeBuildInputs = [ pkgconfig ];

  buildInputs = [ gmp openssl ]
    ++ stdenv.lib.optional stdenv.isDarwin Security
    ++ stdenv.lib.optional stdenv.isLinux dbus;

  # Requires network access, fails in sandbox.
  doCheck = false;

  meta = with stdenv.lib; {
    description = "Build and publish crates with pyo3 bindings as python packages in nix";
    homepage = https://github.com/cchalmers/maturin-nix;
    license = licenses.mit;
    maintainers = [];
    platforms = platforms.all;
  };
}