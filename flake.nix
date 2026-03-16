{
  description = "Reality: SUM ERGO IMPERO";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      flake = { };
      perSystem =
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              claude-code
              codex
              gemini
              gnumake
              python3
            ];
          };
        };
    };
}
