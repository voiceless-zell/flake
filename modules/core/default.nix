{inputs, nixpkgs, self, nixos-hardware, ...}:
let system = "x86_64-linux";
pkgs = import nixpkgs {
  inherit system;
  config.allowUnfree = true;
};
lib = nixpkgs.lib;
in 
{ 
P72 = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs; };
    modules =
    [ (../../hosts/P72/default.nix ) ]
      ++ [ (nixos-hardware.nixosModules.lenovo-thinkpad-p52)]
      ++ [ (inputs.nixvim.nixosModules.nixvim)]
# ++ [ (sops-nix.nixosModules.sops-nix)]
    ;
  };

#testserver = nixpkgs.lib.nixosSystem {
#    specialArgs = { inherit self inputs; };
#    modules = 
#    [ (../../hosts/testserver/default.nix)]
#    ;
#  };

G14 = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs;};
    modules =
    [ (../../hosts/G14/default.nix)]
   ;
  };

T480 = nixpkgs.lib.nixosSystem {
    specialArgs = { inherit self inputs;};
    modules = 
    [ (../../hosts/T480/default.nix)]
    ++ [(nixos-hardware.nixosModules.lenovo-thinkpad-t480)]
  ;
  };
} 
#wsl = nixpkgs.lib.nixosSystem {
#    specialArgs = { inherit self inputs; };
#    modules = 
#         [inputs.NixOS-WSL.nixosModules.wsl]
#      ++ [ (import ../../hosts/wsl/default.nix)]
#      ;
#  };
  

