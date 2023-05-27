{
  description = "XML based toy programming language";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";

    clanlib.url = "github:grumbel/clanlib-1.0";
    clanlib.inputs.nixpkgs.follows = "nixpkgs";
    clanlib.inputs.flake-utils.follows = "flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, clanlib }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = rec {
          default = xmleval;

          xmleval = pkgs.stdenv.mkDerivation {
            pname = "xmleval";
            version = "0.2.0";

            src = ./.;

            nativeBuildInputs = with pkgs; [
              cmake
              pkgconfig
            ];

            buildInputs = [
              clanlib.packages.${system}.default
            ];
           };
        };
      }
    );
}
