{pkgs, inputs, config, nixpkgs, self, ...}: {

  boot.loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
    };
  
  networking = {
    hostName = "mserver";
    networkmanager.enable = true;
    firewall.enable = false;
    };
  programs.java = {enable = true; package = pkgs.jdk8; };
  services.xserver = {
    enable = true;
    xkb.layout = "us";
  #  videoDrivers = [ "nvidia" ];
    displayManager.autoLogin = {
      enable = true;
      user = "zell";
    }; 
  };
}
  
