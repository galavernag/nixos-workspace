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
          inputs.sops-nix.nixosModules.sops

          ./hosts/desktop/configuration.nix

          ./modules/default.nix
          ./modules/system/default.nix

          {
            programs.niri.enable = true;
            services.flatpak.enable = true;

            modules.virtualisation.enable = true;
          }

          ({ pkgs, ...}: {
            environment.sessionVariables = {
              XDG_CURRENT_DESKTOP = "niri";
              XDG_SESSION_TYPE = "wayland";
              XDG_SESSION_DESKTOP = "niri";
            };
            environment.systemPackages = with pkgs; [
              xdg-desktop-portal-gnome
              xdg-desktop-portal-gtk
            ];
          })

          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Aqui passamos as variáveis para os módulos do Home Manager
            home-manager.extraSpecialArgs = { inherit inputs; };

            home-manager.users."galavernag" = import ./users/galavernag/home.nix;
          }
        ];
      };
    };
  };
}
