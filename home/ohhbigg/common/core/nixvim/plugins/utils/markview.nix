{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.utils.markview.enable = lib.mkEnableOption "enables markview module";
  };

  config = lib.mkIf config.nixvim-config.utils.markview.enable {
    programs.nixvim.plugins = {
      markview = {
        enable = true;
      };
    };
  };
}
