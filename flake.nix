{
  description = "XML based toy programming language";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
    flake-utils.url = "github:numtide/flake-utils";

    clanlib.url = "github:grumbel/clanlib-1.0";
    clanlib.inputs.nixpkgs.follows = "nixpkgs";
    clanlib.inputs.flake-utils.follows = "flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, clanlib }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        packages = flake-utils.lib.flattenTree {
          xmleval = pkgs.stdenv.mkDerivation {
            pname = "xmleval";
            version = "0.2.0";
            src = nixpkgs.lib.cleanSource ./.;
            nativeBuildInputs = [
              pkgs.cmake
              pkgs.pkgconfig
            ];
            buildInputs = [
              clanlib.defaultPackage.${system}
            ];
           };
        };
        defaultPackage = packages.xmleval;
      });
}
