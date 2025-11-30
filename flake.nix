{
  description = "Minha configuração de ambiente de trabalho com NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    sops-nix.url = "github:Mic92/sops-nix";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    systemArchitecture = "x86_64-linux";
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        system = systemArchitecture;
        specialArgs = { inherit inputs; };

        modules = [
          # Core configuration and hardware
          inputs.sops-nix.nixosModules.sops
          ./hosts/desktop/configuration.nix

          # System-level modules
          ./modules/system/audio.nix
          ./modules/system/boot.nix
          ./modules/system/locale.nix
          ./modules/system/networking.nix
          ./modules/system/users.nix
          ./modules/system/secrets.nix

          # Feature modules
          ./modules/gaming.nix
          ./modules/virtualisation.nix

          # Desktop Environment and applications
          ./modules/environment/niri.nix
          ./modules/environment/flatpak.nix
          ./modules/environment/noctalia-shell.nix

          # User configuration
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.users."galavernag" = import ./users/galavernag/home.nix;
          }
        ];
      };
    };
  };
}
