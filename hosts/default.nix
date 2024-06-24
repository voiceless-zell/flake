{ nixpkgs, nixos-hardware, self, inputs, nixos-wsl, ...}:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
        inherit system inputs;
        config.allowUnfree = true;
      };
    lib = nixpkgs.lib;
  in
{ 
wsl = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs self; };
        modules = 
        [ (./wsl/default.nix)]
     ++ [ (./../users/zell.nix)]
     ++ [ (nixos-wsl.nixosModules.default)]
       ;
      };
T480 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs self; };
        modules = 
        [ (./T480//default.nix)]
     ++ [ (./../users/zell.nix)]
        ;
      };

}
