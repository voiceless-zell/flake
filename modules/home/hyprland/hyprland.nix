{ inputs
, pkgs
, lib
, config
, isNIXOS
, ...
}:
with lib;
let
cfg = config.modules.hyprland;

in {
  home.packages = with pkgs; [
    swww
    hyprpicker
    wofi
    rofi-wayland
    wlogout
    grim
    slurp
    wl-clipboard
    cliphist
    wf-recorder
    glib
    wayland
    direnv
    grimblast
  ];
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
      systemd.enable = true;
    enable = isNIXOS;
    xwayland = {
      enable = isNIXOS;
    #  hidpi = true;
    };
    #nvidiaPatches = false;
  };
}
