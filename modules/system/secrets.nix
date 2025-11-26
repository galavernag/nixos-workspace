{ ... }:

{
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/galavernag/.config/sops/age/keys.txt";

  sops.secrets.user_password = {
    neededForUsers = true;
  };
}
