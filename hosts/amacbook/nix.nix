{pkgs, ...}:
{
  import = [
    ./../../modules/core/
  ]
  networking.hostName = "amacbook";
  networkmanager.enable = true;

  boot.loader.sytemd-boot.enable = true;
  boot.kernelPackages = pkgs.linkuxPackages_latest;

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
