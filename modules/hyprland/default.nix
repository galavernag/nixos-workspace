{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.hyprland;

in {
  options.modules.hyprland = { enable = mkEnableOption "hyprland"; };
  config = mkIf cfg.enable {
   wayland.windowManager.hyprland = {
     enable = true;
     xwayland.enable = true;
     systemd.enable = true;

     settings = {
			"source" = "~/.cache/wal/colors-hyprland.conf";

			"$mainMod" = "SUPER";
			"$terminal" = "kitty";
			"$fileManager" = "dolphin";
			"$menu" = "rofi -show drun";

			exec-once = [
				"waybar &"
				"bash $HOME/nix/scripts/generate-colorschemes.sh"
				"swww-daemon &"
				"swww img $wallpaper &"
			];	

			monitor = ",preferred,auto,auto";

			general = {
				gaps_in = 5;
				gaps_out = 20;
				border_size = 2;
				
				"col.active_border" = "$color1 45deg";
				"col.inactive_border" = "$color0";

				resize_on_border = true;
				layout = "dwindle";
			};

			decoration = {
				rounding = 6;
				active_opacity = "1.0";
				inactive_opacity = "1.0";
				
				drop_shadow = true;
				shadow_range = 4;
				shadow_render_power = 3;
				"col.shadow" = "rgba(1a1a1aee)";

				blur = {
					enabled = true;
					size = 3;
					passes = 1;

					vibrancy = "0.1696";
				};
			};

			input = {
				kb_layout = "br";

				follow_mouse = 1;
			};

			bind = [
				"$mainMod, Q, exec, $terminal"
				"$mainMod, C, killactive,"
				"$mainMod, M, exit,"
				"$mainMod, E, exec, $fileManager"
				"$mainMod, V, togglefloating,"
				"$mainMod, R, exec, $menu"
				"$mainMod, P, pseudo, "
				"$mainMod, J, togglesplit, "
				"$mainMod, left, movefocus, l"
				"$mainMod, right, movefocus, r"
				"$mainMod, up, movefocus, u"
				"$mainMod, down, movefocus, d"
				"$mainMod, 1, workspace, 1"
				"$mainMod, 2, workspace, 2"
				"$mainMod, 3, workspace, 3"
				"$mainMod, 4, workspace, 4"
				"$mainMod, 5, workspace, 5"
				"$mainMod, 6, workspace, 6"
				"$mainMod, 7, workspace, 7"
				"$mainMod, 8, workspace, 8"
				"$mainMod, 9, workspace, 9"
				"$mainMod, 0, workspace, 10"
				"$mainMod SHIFT, 1, movetoworkspace, 1"
				"$mainMod SHIFT, 2, movetoworkspace, 2"
				"$mainMod SHIFT, 3, movetoworkspace, 3"
				"$mainMod SHIFT, 4, movetoworkspace, 4"
				"$mainMod SHIFT, 5, movetoworkspace, 5"
				"$mainMod SHIFT, 6, movetoworkspace, 6"
				"$mainMod SHIFT, 7, movetoworkspace, 7"
				"$mainMod SHIFT, 8, movetoworkspace, 8"
				"$mainMod SHIFT, 9, movetoworkspace, 9"
				"$mainMod SHIFT, 0, movetoworkspace, 10"
				"$mainMod, S, togglespecialworkspace, magic"
				"$mainMod SHIFT, S, movetoworkspace, special:magic"
				"$mainMod, mouse_down, workspace, e+1"
				"$mainMod, mouse_up, workspace, e-1"
			];

			bindm = [
				"$mainMod, mouse:272, movewindow"
				"$mainMod, mouse:273, resizewindow"
			];
     };
   };
  };
}
