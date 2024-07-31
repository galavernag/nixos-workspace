{ config, pkgs, inputs, ... }:

{
  environment.defaultPackages = with pkgs; [
    vim
    xwayland
    pfetch-rs
    eza
    gh
    polkit polkit_gnome
  ];
  
  # Install fonts
  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      roboto
      openmoji-color
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    fontconfig = {
      hinting.autohint = true;
      defaultFonts = {
        emoji = [ "OpenMoji Color" ];
      };
    };
  };

  nixpkgs.config.allowUnfree = true;
  nix = {
    settings = {
      auto-optimise-store = true;
      allowed-users = [ "galavernag" ];
    };
      
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  security.polkit = {
    enable = true;
  };

  systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
  };
};
 
  boot = {
    loader = {
      #systemd-boot.enable = true;
      #systemd-boot.editor = false;

      grub = {
	device = "nodev";
	efiSupport = true;
	timeoutStyle = "menu";
      };	
      
      timeout = 10;
      efi.canTouchEfiVariables = true;
    };

    kernelParams = [
      "quiet"
      "splash"
      "vga=current"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    consoleLogLevel = 0;
    # https://github.com/NixOS/nixpkgs/pull/108294
    initrd.verbose = false;
  };

  # Set up locales (timezone and keyboard layout)
  time.timeZone = "America/Sao_Paulo";
  i18n.defaultLocale = "pt_BR.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "br-abnt2";
  };

  # Set up user and enable sudo
  users.users.galavernag = {
    isNormalUser = true;
    extraGroups = [ "wheel"
      "input"
      "kvm"
      "docker"
      "tty"
      "uucp"
      "networkmanager" ];
    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;
  };

  # Set up networking and secure it
  networking = {
    networkmanager.enable = true;
  };

  # Set environment variables
  environment.variables = {
    # NIXOS_CONFIG = "$HOME/.config/nixos/configuration.nix";
    NIXOS_CONFIG_DIR = "$HOME/nix";
    NIXPKGS_ALLOW_UNFREE = "1";
    XDG_DATA_HOME = "$HOME/.local/share";
    PASSWORD_STORE_DIR = "$HOME/.local/share/password-store";
    GTK_RC_FILES = "$HOME/.local/share/gtk-1.0/gtkrc";
    GTK2_RC_FILES = "$HOME/.local/share/gtk-2.0/gtkrc";
  };

  # Enable XServer
  services.xserver = {
    enable = true;
    xkb.layout = "br";
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "greeter";
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
      };
    };
  };

  xdg.portal.wlr.enable = true;
  xdg.portal.config.common.default = "*";

  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    jack.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
    };
  };

  system.stateVersion = "24.05";
}
