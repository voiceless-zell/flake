{pkgs, inputs, config, nixpkgs, self, ...}: {
   home-manager.users.zell.wayland.windowManager.hyprland.settings.monitor = [
     "eDP-1,3840x2160,0x0,2"
     "HDMI-A-1,1920x1080,1920x1080, 1"
     "DP-5,1920x1080,3840x1080, 1"
     "DP-4,1920x1080,0x1080,1,transform,3"
     
      ];
}
