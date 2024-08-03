{ pkgs, lib, config, inputs, isNIXOS, ... }:
with lib;
let
cfg = config.modules.qute;
in{
  programs.qutebrowser = {
    enable = true;
    quickmarks = {
    nixpkgs = "https://search.nixos.org/packages";
    home-manager = "https://home-manager-options.extranix.com/?query=&release=master";
    };
  };
}
