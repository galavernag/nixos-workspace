{
  networking = {
    hostName = "nixos";

    networkmanager.enable = true;

    interfaces = {
      enp2s0 = {
        wakeOnLan.enable = true;
      };
    };
  };
}
