{ inputs
, pkgs
, config
, lib
, ...
}: 
  
  with lib;
    let
      cfg = config.modules.packages;
    in {
      
    options.modules.packages = { enable = mkEnableOption "packages"; };
    config = mkIf cfg.enable {
        home.packages = with pkgs; [
      # others
      neofetch
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
      bleachbit
      htop
      minicom
      nvtop
      xdg-utils
      fzf
      ffmpeg
      bore-cli
      discord
      eza
      obsidian
      #programming
      nix-prefetch-github
      rnix-lsp
      #Tmux things stdin/write to file
      moreutils
      libcxxStdenv
# security
    x11_ssh_askpass
    #  sops
#lazyvim
      fd
      gcc
      tree-sitter
      ruby
      nodejs
      
];
    };
}
