{
  description = "Minha configuração de ambiente de trabalho com NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    systemArchitecture = "x86_64-linux";
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        system = systemArchitecture;
        specialArgs = { inherit inputs; };

        modules = [
          inputs.sops-nix.nixosModules.sops

          ./hosts/desktop/configuration.nix

          ./modules/default.nix
          ./modules/system/default.nix

          {
            modules.virtualisation.enable = true;
          }
        ];
      };
    };
  };
}
