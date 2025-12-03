{
  description = "Advent of Code 2025";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    }:
    flake-utils.lib.eachDefaultSystem
      (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        haskellPackages = pkgs.haskellPackages;

        aoc2501 = haskellPackages.callCabal2nix "aoc" ./01 {};
      in
      {
        packages = {
          inherit aoc2501;
        };

        devShells.default = haskellPackages.shellFor {
          packages = _p: [ aoc2501 ];

          buildInputs = [
            pkgs.haskellPackages.cabal-install
            pkgs.haskellPackages.cabal-fmt
          ];

        };
      });
}
