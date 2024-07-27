{ pkgs
, inputs
, config
, lib
, isNIXOS
, ...
}:
{  
  
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs isNIXOS; };
    users.zell = {
      imports = [ (import ./../home/zell.nix) ];
      home.username = "zell";
      home.homeDirectory = "/home/zell";
      home.stateVersion = "23.11";
      programs.home-manager.enable = true;
    };
  };
  users.users = {
    "zell" = {
    isNormalUser = true;
    description = "Pete";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "input" ];
    shell = pkgs.zsh;
    };
  };
  

  nix.settings.allowed-users = [ "zell" ];
}
