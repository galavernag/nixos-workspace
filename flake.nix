{
  description = "NixOS Workspaces";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    pywal-nix.url = "github:Fuwn/pywal.nix";
    pywal-nix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            # Host-specific configuration
            ./hosts/nixos/default.nix

            # Default system modules
            ./modules/bootloader/systemd.nix
            ./modules/system/audio.nix
            ./modules/system/locale.nix
            ./modules/system/networking.nix
            ./modules/system/nix.nix
            ./modules/system/system.nix
            ./modules/system/services.nix

            # User definition (System-wide)
            ./modules/users.nix

            # Apps
            ./apps/default.nix

            inputs."nix-flatpak".nixosModules.nix-flatpak
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";

              home-manager.users.galavernag = import ./users/galavernag/home.nix {
                inherit pkgs lib;
                pywalModule = inputs."pywal-nix".homeManagerModules.${system}.default;
              };
            }
          ];
        };
      };
    };
}
