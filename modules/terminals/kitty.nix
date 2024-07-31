{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.kitty;

in {
  options.modules.kitty = { enable = mkEnableOption "kitty"; };
  config = mkIf cfg.enable {
    programs.kitty = {
      enable = true;

      font = { 
	name = "JetBrainsMono Nerd Font"; 
	size = 11;
      };
            
      settings = {
	cursor_shape = "beam";
	cursor_shape_unfocused = "beam";

	modify_font = "cell_height 1.6px";

	background_opacity = "0.8";
	background_blur = 1;

	window_padding_width = 6;
      };
    };
  };
}
