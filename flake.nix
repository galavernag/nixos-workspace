{
  description = "Nix OS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { home-manager, nixpkgs, ...} @ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;

      mkSystem = pkgs: system: hostname:
        pkgs.lib.nixosSystem {
            system = system;
            modules = [
                { networking.hostName = hostname; }
                # General configuration (users, networking, sound, etc)
                ./modules/system/configuration.nix
                # Hardware config (bootloader, kernel modules, filesystems, etc)
                # DO NOT USE MY HARDWARE CONFIG!! USE YOUR OWN!!
                (./. + "/hosts/${hostname}/hardware.nix")
                home-manager.nixosModules.home-manager
                {
                    home-manager = {
                        useUserPackages = true;
                        useGlobalPkgs = true;
			backupFileExtension = "backup";
                        extraSpecialArgs = { inherit inputs; };
                        # Home manager config (configures programs like firefox, zsh, eww, etc)
                        users.galavernag = (./. + "/hosts/${hostname}/user.nix");
                    };
                }
            ];
            specialArgs = { inherit inputs; };
        };
    in {
      nixosConfigurations = {
        # Now, defining a new system is can be done in one line
        #                                Architecture   Hostname
        Voldemort = mkSystem inputs.nixpkgs "x86_64-linux" "Voldemort";
      };
    };
}
