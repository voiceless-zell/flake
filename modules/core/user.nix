{ pkgs
, inputs
, config
, lib
, ...
}:
{  
  
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users.zell = {
      imports = [ (import ./../home/zell.nix) ];
      home.username = "zell";
      home.homeDirectory = "/home/zell";
      home.stateVersion = "23.11";
      programs.home-manager.enable = true;
    };
    users.nixos = {
        import = [ (import ./../home/nixos.nix) ];
        home.username = "nixos";
        home.homeDirectory = "/home/nixos";
        home.stateVersion = "23.11"
        programs.home-manager.enable = true;
        }
  };
 users.users = {
    "zell" = {
    isNormalUser = true;
    description = "Pete";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    };
    "nixos" = {
        isNormalUser = true;
        description = "WSL";
        extraGroups = [ "networkmanager" "wheel"];
        shell = pkgs.zsh;
      };
 };
 
 nix.settings.allowed-users = [ "zell" "nixos" ];
  } 

