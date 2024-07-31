{ pkgs, lib, config, ... }:
with lib;
let cfg = config.modules.zsh;
in {
    options.modules.zsh = { enable = mkEnableOption "zsh"; };

    config = mkIf cfg.enable {
    	home.packages = [
	    pkgs.zsh
	];

	programs.starship = { 
		enable = true;
	};
	
	home.file.".config/starship.toml".source = ./starship.toml;

        programs.zsh = {
            enable = true;

            # directory to put config files in
            dotDir = ".config/zsh";

            enableCompletion = true;
            autosuggestion.enable = true;
            syntaxHighlighting.enable = true;

	    initExtra = ''
	    	pfetch
		eval "$(starship init zsh)"
	    ''; 

            # Tweak settings for history
            history = {
                save = 1000;
                size = 1000;
                path = "$HOME/.cache/zsh_history";
            };

            # Set some aliases
            shellAliases = {
		rebuild = "sudo nixos-rebuild switch --flake $HOME/nix"; 
            };
    };
};
}
