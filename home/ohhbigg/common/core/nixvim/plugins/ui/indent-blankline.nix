{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.ui.indent-blankline.enable = lib.mkEnableOption "enables indent-blankline module";
  };

  config = lib.mkIf config.nixvim-config.ui.indent-blankline.enable {
    programs.nixvim.plugins = {
      indent-blankline = {
        enable = true;
      };
    };
  };
}
