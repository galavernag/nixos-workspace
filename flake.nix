{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    awww.url = "git+https://codeberg.org/LGFae/awww";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nix-flatpak,
      home-manager,
      awww,
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs-stable = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      pkgs-unstable = import inputs.nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          # Replace "nixos" with your system's hostname
          specialArgs = {
            inherit
              inputs
              nix-flatpak
              pkgs-stable
              pkgs-unstable
              awww
              ;
          };
          system = "x86_64-linux";
          modules = [
            nix-flatpak.nixosModules.nix-flatpak
            ./hosts/nixos/settings.nix

            ./modules/default.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit
                  inputs
                  nix-flatpak
                  pkgs-stable
                  pkgs-unstable
                  ;
              };
              home-manager.users.galavernag = ./users/galavernag/home.nix;
            }
          ];
        };
      };
    };
}
