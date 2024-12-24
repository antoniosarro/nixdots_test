{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.ui.nvim-colorizer.enable = lib.mkEnableOption "enables nvim-colorizer module";
  };

  config = lib.mkIf config.nixvim-config.ui.nvim-colorizer.enable {
    programs.nixvim.plugins = {
      nvim-colorizer = {
        enable = true;
      };
    };
  };
}
