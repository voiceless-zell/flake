{
  description = "Home Manager configuration of zell";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    obsidian-nvim = { url = "github:epwalsh/obsidian.nvim"; flake = false; };
    nix-colors.url = "github:misterio77/nix-colors";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };


  outputs = { nixpkgs, home-manager, self, nixos-hardware, nixos-wsl, ... }@inputs:
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; config.allowunfree = true;};
      system = "x86_64-linux";
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = import ./hosts/default.nix {
          inherit self nixpkgs inputs nixos-hardware nixos-wsl ;
        } ;
      
      homeConfigurations."zell" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ 	
	  ./home-manager/home.nix 
	];
        extraSpecialArgs = { inherit inputs; };
        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
     };
}
