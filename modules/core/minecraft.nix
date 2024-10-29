{ ... }:
{
  services.minecraft-server = {
    enable = true;
    eula = true;

    servers = {
      home = {
        enable = true;
      };
    };
  };
}
