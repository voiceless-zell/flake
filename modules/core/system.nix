{ self
, pkgs
, inputs
, ...
}: 
let

in{
 
  imports = [ inputs.nix-gaming.nixosModules.steamCompat ]; #TODO check this
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://nix-gaming.cachix.org" ];
      trusted-public-keys = [ "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4=" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  

  environment.systemPackages = with pkgs; [
    wget
    git
    barrier
    x11_ssh_askpass
];

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "23.05";

}
