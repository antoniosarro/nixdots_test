{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.utils.ufo.enable = lib.mkEnableOption "enables ufo module";
  };

  config = lib.mkIf config.nixvim-config.utils.ufo.enable {
    programs.nixvim.plugins = {
      nvim-ufo = {
        enable = true;
      };
    };
  };
}
