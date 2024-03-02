{pkgs, inputs, config, nixpkgs, self, ...}: {
   home-manager.users.zell = { 
    wayland.windowManager.hyprland.settings.monitor = [
     "eDP-1,1920x1080,0x0,1"
     "DP-3,1920x1080,0x-1080, 1"
     "HDMI-A-1,1920x1080,-1920x-1080, 1"
     "DP-2,1920x1080,-3840x-1080,1"
      ]; 
    wayland.windowManager.hyprland.settings.workspace = [
    "1,name:Terminal,on-created-empty:foot -e tmux,monitor:HDMI-A-1"
    "4,name:Notes,on-created-empty:foot,monitor:eDP-1"
    "2,name:Web,on-created-empty:firefox,monitor:DP-3"
    "3,name:SSH,on-created-empty:foot -e tmux,monitor:DP-2" 
    ];
    };
}
