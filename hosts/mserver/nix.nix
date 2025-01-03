{
  ...
}:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking = {
    hostName = "mserver";
    networkmanager.enable = true;
    firewall.enable = false;
  };
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = [ "intel" ];
    desktopManager.gnome = {
      enable = true;
    };
  };
  hardware.opengl = {
    enable = true;
    extraPackages =
      [
      ];
  };
}
