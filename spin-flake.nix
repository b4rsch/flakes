{
  description = "spin environment";

  inputs.nixpkgs.url = "nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; config.allowUnfree = true; };
    in
    {
      devShells."x86_64-linux".default = pkgs.mkShell {
        buildInputs = with pkgs; [
            cargo
            cargo-watch
            docker
            fermyon-spin
            k3d
            kubectl
            rust-analyzer
            rustup
        ];
      };
    };
}
