{ pkgs, lib, config, ... }:

with lib;
let 
    cfg = config.modules.pywal;
    template_folder = ".config/wal/templates";
in {
  options.modules.pywal = { enable = mkEnableOption "pywal"; };
  config = mkIf cfg.enable {
    programs.pywal = {
      enable = true;
    };

    # Rofi theme
    home.file."${template_folder}/colors-rofi-dark.rasi".text = ''
      * {{
        active-background: {color2};
        active-foreground: @foreground;
        normal-background: @background;
        normal-foreground: @foreground;
        urgent-background: {color1};
        urgent-foreground: @foreground;

        alternate-active-background: @background;
        alternate-active-foreground: @foreground;
        alternate-normal-background: @background;
        alternate-normal-foreground: @foreground;
        alternate-urgent-background: @background;
        alternate-urgent-foreground: @foreground;

        selected-active-background: {color1};
        selected-active-foreground: @foreground;
        selected-normal-background: {color2};
        selected-normal-foreground: @foreground;
        selected-urgent-background: {color3};
        selected-urgent-foreground: @foreground;

        background-color: @background;
        background: {background};
        foreground: {foreground};
        border-color: @background;
        spacing: 2;
      }}

      #window {{
          background-color: @background;
          border: 0;
          padding: 2.5ch;
      }}

      #mainbox {{
          border: 0;
          padding: 0;
      }}

      #message {{
          border: 2px 0px 0px;
          border-color: @border-color;
          padding: 1px;
      }}

      #textbox {{
          text-color: @foreground;
      }}

      #inputbar {{
          children:   [ prompt,textbox-prompt-colon,entry,case-indicator ];
      }}

      #textbox-prompt-colon {{
          expand: false;
          str: ":";
          margin: 0px 0.3em 0em 0em;
          text-color: @normal-foreground;
      }}

      #listview {{
          fixed-height: 0;
          border: 2px 0px 0px;
          border-color: @border-color;
          spacing: 2px;
          scrollbar: true;
          padding: 2px 0px 0px;
      }}

      #element {{
          border: 0;
          padding: 1px;
      }}

      #element-text, element-icon {{
          background-color: inherit;
          text-color:       inherit;
      }}

      #element.normal.normal {{
          background-color: @normal-background;
          text-color: @normal-foreground;
      }}

      #element.normal.urgent {{
          background-color: @urgent-background;
          text-color: @urgent-foreground;
      }}

      #element.normal.active {{
          background-color: @active-background;
          text-color: @active-foreground;
      }}

      #element.selected.normal {{
          background-color: @selected-normal-background;
          text-color: @selected-normal-foreground;
      }}

      #element.selected.urgent {{
          background-color: @selected-urgent-background;
          text-color: @selected-urgent-foreground;
      }}

      #element.selected.active {{
          background-color: @selected-active-background;
          text-color: @selected-active-foreground;
      }}

      #element.alternate.normal {{
          background-color: @alternate-normal-background;
          text-color: @alternate-normal-foreground;
      }}

      #element.alternate.urgent {{
          background-color: @alternate-urgent-background;
          text-color: @alternate-urgent-foreground;
      }}

      #element.alternate.active {{
          background-color: @alternate-active-background;
          text-color: @alternate-active-foreground;
      }}

      #scrollbar {{
          width: 4px;
          border: 0;
          handle-width: 8px;
          padding: 0;
      }}

      #sidebar {{
          border: 2px 0px 0px;
          border-color: @border-color;
      }}

      #button {{
          text-color: @normal-foreground;
      }}

      #button.selected {{
          background-color: @selected-normal-background;
          text-color: @selected-normal-foreground;
      }}

      #inputbar {{
          spacing: 0;
          text-color: @normal-foreground;
          padding: 1px;
      }}

      #case-indicator {{
          spacing: 0;
          text-color: @normal-foreground;
      }}

      #entry {{
          spacing: 0;
          text-color: @normal-foreground;
      }}

      #prompt {{
          spacing: 0;
          text-color: @normal-foreground;
      }}
    '';
    
    # Waybar theme
    home.file."${template_folder}/colors-waybar.css".text = ''
        * {
            border: none;
            border-radius: 0;
            font-family: "Ubuntu Nerd Font";
            font-size: 13px;
            min-height: 0;
        }

        window#waybar {
            background: @background;
            color: @cursor;
        }

        #window {
            font-weight: bold;
            font-family: "Ubuntu";
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

    # Hyprland theme
    home.file."${template_folder}/colors-hyprland.conf".text = ''
        $background = rgb({background.strip})
        $background = rgb({foreground.strip})
        $wallpaper = {wallpaper}
        
        $color0 = rgb({color0.strip})
        $color1 = rgb({color1.strip})
        $color2 = rgb({color2.strip})
        $color3 = rgb({color3.strip})
        $color4 = rgb({color4.strip})
        $color5 = rgb({color5.strip})
        $color6 = rgb({color6.strip})
        $color7 = rgb({color7.strip})
        $color8 = rgb({color8.strip})
        $color9 = rgb({color9.strip})
        $color10 = rgb({color10.strip})
        $color11 = rgb({color11.strip})
        $color12 = rgb({color12.strip})
        $color13 = rgb({color13.strip})
        $color14 = rgb({color14.strip})
        $color15 = rgb({color15.strip})
    '';
  };
}