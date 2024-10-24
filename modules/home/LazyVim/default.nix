{ ... }:
{
  programs = {
    lazyvim = {
      enable = true;
      extras = {
        coding = {
          mini-surround.enable = true;

          yanky.enable = true;
        };
        lang = {
          nix.enable = true;
        };
        test = {
          core.enable = true;
        };
      };
    };
    lazygit.enable = true;
    ripgrep.enable = true;

  };
}
