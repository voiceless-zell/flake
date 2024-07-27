{ config, pkgs, isNIXOS, ... }:{

  environment.systemPackages = with pkgs; [
  virt-manager
  virt-viewer
  spice
  spice-gtk
  spice-protocol
  win-virtio
  win-spice
  virtiofsd
  ];
    virtualisation = {
    libvirtd = {
      enable = isNIXOS;
      qemu = {
        swtpm.enable = isNIXOS;
        ovmf.enable = isNIXOS;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = isNIXOS;
  };
  services.spice-vdagentd.enable = isNIXOS;
}
