{
  description = "Python dev environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      python = pkgs.python314;
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [ python ] ++ (with pkgs; [ uv ruff ]);

        env = {
          # Use the Nix Python instead of letting uv download its own
          UV_PYTHON = "${python}/bin/python3";
          UV_PYTHON_DOWNLOADS = "never";
        };
      };
    };
}
