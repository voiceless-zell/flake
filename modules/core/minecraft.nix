{pkgs, lib, config, ...}:
{
services.minecraft-server = {
    enable = true;
    eula = true;
  }
