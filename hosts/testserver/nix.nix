{pkgs, inputs, config, nixpkgs, self, ...}: 
{        

boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

networking = {
      hostName = "testserver";
    networkmanager.enable = true;
    firewall.enable = false;
  };
services = {
    conman.enable = true;
  };
  
   services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = [ "nvidia" ];
    displayManager.autoLogin = {
      enable = true;
      user = "zell";
    };
    libinput = {
      enable = true;
      mouse = {
        accelProfile = "flat";
      };
    };
  };
}
