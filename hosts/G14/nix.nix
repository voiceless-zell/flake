{ pkgs, inputs, config, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernel.sysctl = {
  "vm.max_map_count" = 20971520;
  "fs.file-max" = 524288;
};
#boot.initrd.preDeviceCommands = ''
#  DEVS="0000:01:00.0 0000:01:00.1"
#  for DEV in $DEVS; do
#    echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
#  done
#  modprobe -i vfio-pci
#'';
boot.kernelParams = [ "intel_iommu=on" "pcie_aspm=off" ];
boot.initrd.availableKernelModules = [  "vfio-pci"];
  networking = {
    hostName = "G14";
    networkmanager.enable = true;
    firewall.enable = false;
  };
  zramSwap.enable = true;
   services.xserver = {
    enable = true;
    xkb.layout = "us";
   videoDrivers = [ "amdgpu" "nvidia" ];
    desktopManager.gnome = {
        enable = true;
      };
   };
 hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.production;
     modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    dynamicBoost.enable = true;
    nvidiaSettings = true;
     prime ={
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:04:00:0";
      nvidiaBusId = "PCI:01:00:0";
     };   
  };
  services.asusd.enable = true;
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
    intel-compute-runtime
    intel-media-driver
  ];
  };
  powerManagement.cpuFreqGovernor = "performance";
 # services.tailscale = {
 #   enable = true;
 #   useRoutingFeatures = "client";
 #   };

}
