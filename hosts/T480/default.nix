{ pkgs, nixpkgs, inputs, config, ... }:
{
imports = [
  ./../../nixos/common/program.nix
  ./../../nixos/common/system.nix
  ];
boot.kernelModules = [ "kvm-intel" ];
nixpkgs.config.allowUnfree = true;
 networking = {
    hostName = "T480";
  };
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = [  "intel"  ];
    desktopManager.gnome = {
        enable = true;
        };
    libinput = {
        enable = true;
        mouse = {
            accelProfile = "flat";
          };
      };
    };
    hardware = {
      opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
        extraPackages = with pkgs; [
        ];
      };
    };
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  services.gvfs.enable = true;
  nixpkgs.hostPlatform = "x86_64-linux";
}
