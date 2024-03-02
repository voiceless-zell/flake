{ pkgs, inputs, config, nixpkgs, ... }: {
  imports = [
      ./nix.nix
      ./../../modules/core/hardware.nix
       ./../../modules/core/pipewire.nix
       ./../../modules/core/program.nix
       ./../../modules/core/security.nix
       ./../../modules/core/services.nix
       ./../../modules/core/system.nix
       ./../../modules/core/user.nix
       ./../../modules/core/wayland.nix
       ./../../modules/core/obsidian.nix
       ./hardware-configuration.nix
       ./homemanager.nix
    ];
}


 
