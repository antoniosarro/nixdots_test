{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.utils.colorizer.enable = lib.mkEnableOption "enables nvim-colorizer module";
  };

  config = lib.mkIf config.nixvim-config.utils.colorizer.enable {
    programs.nixvim.plugins = {
      nvim-colorizer = {
        enable = true;
      };
    };
  };
}
