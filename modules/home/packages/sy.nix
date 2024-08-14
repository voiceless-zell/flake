{ inputs
, pkgs
, config
, lib
, ...
}: 
  
 {
      
    options.modules.packages = { enable = mkEnableOption "packages"; };
    config = mkIf cfg.enable {
        home.packages = with pkgs; [
      # others
      bitwarden
      p7zip
      openssl
      libnotify
      pamixer
      xfce.thunar
      pavucontrol
      wget
      unzip
      gparted
      mpv
      playerctl
      qalculate-gtk
      htop
      nvtopPackages.full
      fzf
      ffmpeg
      discord
      eza
      obsidian
      glib
      #programming
      nix-prefetch-github
      #Tmux things stdin/write to file
      moreutils
      libcxxStdenv
# security
    x11_ssh_askpass
#lazyvim
      fd
      gcc
      tree-sitter
      ruby
      nodejs
      prismlauncher
      zulu8
];
    };
}
