{lib, config, ...}:
with lib;
let
cfg = config.modules.foot;
in {
  options.modules.foot = { enable = mkEnableOption "foot";};
  config = mkIf cfg.enable {
  programs.foot = {
    enable = true;
  };
  xdg.configFile."foot/foot.ini".source = ./foot.ini;
  };
}
