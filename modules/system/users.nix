{ config, ... }: # Removi 'inputs', adicionei 'config'

{
  users.mutableUsers = false;
  users.users.galavernag = {
    isNormalUser = true;
    description = "Guilherme Galaverna";
    # O caminho correto é acessado via config.sops...path
    hashedPasswordFile = config.sops.secrets.user_password.path;
    extraGroups = [ "wheel" ];
  };
}
