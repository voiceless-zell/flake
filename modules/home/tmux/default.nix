{config, lib, pkgs, ...}:
with lib;
let
cfg = config.modules.tmux;
in {
options.modules.tmux = {enable = mkEnableOption "tmux";};
config = mkIf cfg.enable {
programs.tmux ={
  enable = true;
  shell = "/run/current-system/sw/bin/zsh";
  terminal = "screen-256color";
  escapeTime = 10;
  plugins = (with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.continuum
      tmuxPlugins.resurrect
      ]);
  extraConfig = ''
  set-option -g mouse on
  set -g default-terminal 'tmux-256color'
  set -as terminal-overrides ",foot*:Tc"
  set -g @resurrect-strategy-nvim 'session'
  set -g @resurrect-capture-pane-contents 'on'
  set -g @continuum-restore 'on'
  set -g @continuum-boot 'on'
  set -g @continuum-boot-options 'foot'
  set -g @continuum-save-interval '10'
  '';
};
};
}
