{ inputs, pkgs, isNIXOS, ... }:
{
  programs.hyprland.enable = isNIXOS;
  xdg.portal = {
    enable = isNIXOS;
    wlr.enable = isNIXOS;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
    ];
  };
}
