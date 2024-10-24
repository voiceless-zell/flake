{
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];
  networking.hostName = "amacbook";
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.xserver = {
    enable = true;
    layout = "us";
    displayManager = {
      sddm.enable = true;
    };
    desktopManager = {
      gnome.enable = true;
    };
    libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
      };
    };
  };
}
