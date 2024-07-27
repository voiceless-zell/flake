{ pkgs, lib, isNIXOS, ... }: {
  programs.steam = {
    enable = isNIXOS;
    remotePlay.openFirewall = isNIXOS;
    dedicatedServer.openFirewall = false;
  };
  programs.gamemode.enable = isNIXOS;
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-runtime"
  ];
}
