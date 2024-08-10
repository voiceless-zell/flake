 { pkgs, inputs, config, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
};
  networking = {
    hostName = "symac";
    networkmanager.enable = true;
    firewall.enable = false;
  };
  zramSwap.enable = true;
   services.xserver = {
    enable = true;
    xkb.layout = "us";
   videoDrivers = [ "intel" ];
   };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
  ];
  };

}
