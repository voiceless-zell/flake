{ pkgs, inputs, config, ... }: {

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = ["kvm-intel"];
  networking = {
    hostName = "G14";
    networkmanager.enable = true;
    firewall.enable = false;
  };
services.hardware.bolt.enable = true;
     services.xserver = {
    enable = true;
    xkb.layout = "us";
    videoDrivers = ["nvidia" ];
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
  hardware = {
      opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      };
      nvidia = {
          modesetting.enable = true;
          powerManagement.enable = false;
          powerManagement.finegrained = false;
          open = false;
          nvidiaSettings = true;
          package = config.boot.kernelPackages.nvidiaPackages.stable;
          prime = {
#      bus info: pci@0000:01:00.0
#      bus info: pci@0000:04:00.0
              amdgpuBusId = "PCI:1:0:0";
              nvidiaBusId = "PCI:4:0:0";
            };
        };
  };
services.gvfs.enable = true;
}
