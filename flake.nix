{
  description = "NixOS Workspaces";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; };

  outputs = { self, nixpkgs }:
    let pkgs = import nixpkgs { inherit system; };
    in {
      inherit system;
      nixosConfigurations.nixos-desktop = pkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./modules/core/audio.nix
          ./modules/core/networking.nix
          ./modules/core/locale.nix
          ./modules/core/system.nix

          # Desktop Environments
          ./modules/desktop/cosmic.nix
        ];
      };
    };
}
