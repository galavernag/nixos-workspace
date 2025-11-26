{
  description = "Minha configuração de ambiente de trabalho com NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = nixpkgs.lib.nixosSystem;
  in {
    nixosConfigurations = {
      desktop = system {
        specialArgs = { inputs };
        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };
    };
  };
}
