{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.warp-terminal;

in {
    options.modules.warp-terminal = { enable = mkEnableOption "warp-terminal"; };
    config = mkIf cfg.enable {
	home.packages = with pkgs; [
		warp-terminal
	];
    };
}
