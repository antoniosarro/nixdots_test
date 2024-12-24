{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.ui.colorizer.enable = lib.mkEnableOption "enables colorizer module";
  };

  config = lib.mkIf config.nixvim-config.ui.colorizer.enable {
    programs.nixvim.plugins = {
      colorizer = {
        enable = true;
      };
    };
  };
}
