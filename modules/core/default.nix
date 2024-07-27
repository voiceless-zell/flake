{inputs, nixpkgs, self, nixos-hardware, nixos-wsl, ...}:
let system = "x86_64-linux";
pkgs = import nixpkgs {
  inherit system;
  config.allowUnfree = true;
};
lib = nixpkgs.lib;
in 
{ 
  G14 = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs; isNIXOS = true;};
    modules =
    [ (../../hosts/G14/default.nix)]
#++ [ (nixos-hardware.nixosModules.asus-zephyrus-ga401)]
   ;
  };
  P16 = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit self inputs; isNIXOS = true;};
    modules =
    [ (../../hosts/P16/default.nix)]
   ;
  };
  WSL = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit self inputs;isNIXOS = false;};
      modules = 
      [ (../../hosts/WSL/default.nix)]
   ++ [ (nixos-wsl.nixosModules.default)]
      ;
    };
}
