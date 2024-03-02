{ pkgs, lib, config, ... }:
with lib;
let
cfg = config.modules.git;

in {
  options.modules.git = {enable = mkEnableOption "git";};
  config = mkIf cfg.enable {
  programs.git.enable = true;
  programs.git.userName = "zell992004";
  programs.git.userEmail = "zell992004@gmail.com";
  home.packages = [ pkgs.gh ];
  };
}
