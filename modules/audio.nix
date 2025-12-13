{ config, lib, ... }:
let
  cfg = config.modules.audio;
in
{
  options.modules.audio = {
    enable = lib.mkEnableOption "Ativa o módulo de audio.";
  };

  # Enable sound with pipewire.
  config = lib.mkIf cfg.enable {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
