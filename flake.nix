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
        aoc2502 = haskellPackages.callCabal2nix "aoc" ./02 {};
        aoc2503 = haskellPackages.callCabal2nix "aoc" ./03 {};
        aoc2504 = haskellPackages.callCabal2nix "aoc" ./04 {};
        aoc2505 = haskellPackages.callCabal2nix "aoc" ./05 {};
        aoc2506 = haskellPackages.callCabal2nix "aoc" ./06 {};
      in
      {
        packages = {
          inherit
            aoc2501
            aoc2502
            aoc2503
            aoc2504
            aoc2505
            aoc2506;
        };

        devShells.default = haskellPackages.shellFor {
          packages = _p: [
            aoc2501
            aoc2502
            aoc2503
            aoc2504
            aoc2505
            aoc2506
          ];

          buildInputs = [
            pkgs.haskellPackages.cabal-install
            pkgs.haskellPackages.cabal-fmt
          ];

        };
      });
}
