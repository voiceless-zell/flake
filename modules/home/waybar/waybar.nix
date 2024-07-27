{ config, lib, pkgs, isNIXOS, ... }:
with lib;
let
  cfg = config.modules.waybar;
in{

  programs.waybar = {
    enable = isNIXOS;
    systemd = {
      enable = true;
     target = "xdg-desktop-autostart.target";
    };
  };
#  programs.waybar.package = pkgs.waybar.overrideAttrs (oa: {
#    mesonFlags = (oa.mesonFlags or [ ]) ++ [ "-Dexperimental=true" ];
#  });
}
