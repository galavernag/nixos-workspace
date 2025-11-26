{
  description = "Minha configuração de ambiente de trabalho com NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = nixpkgs.lib.nixosSystem;
    username = "galavernag";
  in {
    nixosConfigurations = {
      desktop = system {
        specialArgs = { inputs, username };
        modules = [
          ./hosts/desktop/configuration.nix
          ./modules/default.nix

          {
            modules.virtualisation.enable = true;
          }
        ];
      };
    };
  };
}
