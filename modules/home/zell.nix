{ inputs, config, lib, pkgs, isNIXOS, ... }: {
  imports =
       [ (import ./waybar) ]
    ++ [ (import ./firefox) ]
    ++ [ (import ./hyprland) ]
    ++ [ (import ./git) ]
    ++ [ (import ./term/foot) ]
    ++ [ (import ./swaylock) ]
    ++ [ (import ./wofi) ]
    ++ [ (import ./zsh) ]
    ++ [ (import ./mako) ]
    ++ [ (import ./starship) ]
    ++ [ (import ./wlogout) ]
    ++ [ (import ./packages) ]
    ++ [ (import ./tmux)]
    ++ [ (import ./lazyvim)]
    ++ [ (import ./ncspot)]
    ++ [ (import ./term/kitty)]
    ++ [ (import ./gtk)]
   
    ;
    config.modules = {
        kitty.enable = true;
        ncspot.enable = true;
        lazyvim.enable = true;
        tmux.enable = true;
        git.enable = true;
        foot.enable = true;
        wofi.enable = true;
        zsh.enable = true;
        wlogout.enable = true;
        packages.enable = true;
    };
}
