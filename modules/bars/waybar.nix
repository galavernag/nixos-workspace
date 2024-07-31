{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.waybar;

in {
  options.modules.waybar = { enable = mkEnableOption "waybar"; };
  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          "layer" = "top"; 
          "position" = "top"; 
          "height" = 30;
          "spacing" = 20;
          "modules-left" = ["hyprland/workspaces" "custom/spotify"];
          "modules-center" = ["hyprland/window"];
          "modules-right" = ["pulseaudio" "network" "cpu" "memory" "battery" "tray" "clock"];
          "hyprland/workspaces" = {
              "disable-scroll" = true;
              "all-outputs" = false;
              "format" = "{}";
          };
          "tray" = {
              "spacing" = 10;
          };
          "clock" = {
              "format-alt" = "{:%Y-%m-%d}";
          };
          "cpu" = {
              "format" = "{usage}% ";
          };
          "memory" = {
              "format" = "{}% ";
          };
          "battery" = {
              "bat" = "BAT0";
              "states" = {
                  "warning" = 30;
                  "critical" = 15;
              };
              "format" = "{capacity}% {icon}";
              "format-icons" = ["" "" "" "" ""];
          };
          "network" = {
              "format-wifi" = "{essid} ({signalStrength}%) ";
              "format-ethernet" = "{ifname} = {ipaddr}/{cidr} ";
              "format-disconnected" = "Disconnected ⚠";
          };
          "pulseaudio" = {
              "format" = "{volume}% {icon}";
              "format-bluetooth" = "{volume}% {icon}";
              "format-muted" = "";
              "format-icons" = {
                  "headphones" = "";
                  "handsfree" = "";
                  "headset" = "";
                  "phone" = "";
                  "portable" = "";
                  "car" = "";
                  "default" = ["" ""];
              };
              "on-click" = "pavucontrol";
          };
          "custom/spotify" = {
              "format" = "  {}";
              "max-length" = 40;
              "interval" = 30; 
              "exec" = "$HOME/.config/waybar/mediaplayer.sh 2> /dev/null"; 
              "exec-if" = "pgrep spotify";
          };
        };
      };
    };

    home.file.".config/waybar/style.css".text = ''
          @import url("../../.cache/wal/colors-waybar.css");

          * {
            border: none;
            border-radius: 0;
            font-family: "JetBrainsMono Nerd Font";
            font-size: 13px;
            min-height: 0;
          }

          window#waybar {
              background: @background;
              color: white;
          }

          #window {
              font-weight: bold;
          }
          /*
          #workspaces {
              padding: 0 5px;
          }
          */

          #workspaces button {
              padding: 0 5px;
              background: transparent;
              color: white;
              border-top: 2px solid transparent;
          }

          #workspaces button.focused {
              color: #c9545d;
              border-top: 2px solid #c9545d;
          }

          #mode {
              background: #64727D;
              border-bottom: 3px solid white;
          }

          #clock, #battery, #cpu, #memory, #network, #pulseaudio, #custom-spotify, #tray, #mode {
              padding: 0 3px;
              margin: 0 2px;
          }

          #clock {
              font-weight: bold;
          }

          #battery {
          }

          #battery icon {
              color: red;
          }

          #battery.charging {
          }

          @keyframes blink {
              to {
                  background-color: #ffffff;
                  color: black;
              }
          }

          #battery.warning:not(.charging) {
              color: white;
              animation-name: blink;
              animation-duration: 0.5s;
              animation-timing-function: linear;
              animation-iteration-count: infinite;
              animation-direction: alternate;
          }

          #cpu {
          }

          #memory {
          }

          #network {
          }

          #network.disconnected {
              background: #f53c3c;
          }

          #pulseaudio {
          }

          #pulseaudio.muted {
          }

          #custom-spotify {
              color: rgb(102, 220, 105);
          }

          #tray {
          }
        '';
  };
}