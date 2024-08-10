{ pkgs, inputs, config, nixpkgs, isNIXOS, ... }: {
  imports = [
      ./hardware-configuration.nix
      ./nix.nix
      ./../../modules/core/virtualisation.nix
      ./../../modules/core/security.nix
      ./../../modules/core/services.nix
      ./../../modules/core/system.nix
      ./../../modules/core/user.nix
      ./homemanager.nix
    ];
}
