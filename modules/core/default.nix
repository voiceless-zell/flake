{
  inputs,
  nixpkgs,
  self,
  nixos-wsl,
  ...
}:
{
  symac = nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit self inputs;
      isNIXOS = true;
    };
    modules = [ ../../hosts/symac/default.nix ]
    #++ [ (nixos-hardware.nixosModules.asus-zephyrus-ga401)]
    ;
  };

  G14 = nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit self inputs;
      isNIXOS = true;
    };
    modules = [ ../../hosts/G14/default.nix ]
    #++ [ (nixos-hardware.nixosModules.asus-zephyrus-ga401)]
    ;
  };
  P16 = nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit self inputs;
      isNIXOS = true;
    };
    modules = [ ../../hosts/P16/default.nix ];
  };
  WSL = nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit self inputs;
      isNIXOS = false;
    };
    modules = [ ../../hosts/WSL/default.nix ] ++ [ (nixos-wsl.nixosModules.default) ];
  };
  mserver = nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit self inputs;
      isNIXOS = true;
    };
    modules = [ ../../hosts/mserver/default.nix ];
  };
  amacbook = nixpkgs.lib.nixosSystem {
    specialArgs = {
      inherit self inputs;
      isNIXOS = true;
    };
    modules = [ ../../hosts/amacbook/default.nix ];
  };
}
