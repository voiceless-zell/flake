{ inputs
, pkgs
, config
, lib
, ...
}: 
  
  with lib;
    let
      cfg = config.modules.packages;
      star-citizen = pkgs.star-citizen.override (prev: {
          wineDllOverrides = prev.wineDllOverrides ++ [ "dxgi=n" ];
        });
    in {
      
    options.modules.packages = { enable = mkEnableOption "packages"; };
    config = mkIf cfg.enable {
        home.packages = with pkgs; [
      # others
      p7zip
      neofetch
      openssl
      libnotify
      pamixer
      pavucontrol
      wget
      unzip
      gparted
      mpv
      playerctl
      qalculate-gtk
      htop
      fzf
      ffmpeg
#      discord
      eza
      cmatrix
      glib
      #programming
      nix-prefetch-github
      #Tmux things stdin/write to file
      moreutils
      libcxxStdenv
  #lazyvim
      fd
      gcc
      tree-sitter
      ruby
      nodejs
      nvtopPackages.full
 ];
    };
}
