{
  description = "Essentials of compilation follow-along.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system} = {
        esscomp = pkgs.mkShell {
          name = "esscomp";

          # Figuring out how to make it work with racket-minimal is
          # future work...
          packages = [ pkgs.racket ];
        };

        default = self.devShells.${system}.esscomp;
      };
    };
}
