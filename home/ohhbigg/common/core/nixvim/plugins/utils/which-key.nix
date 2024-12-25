{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.utils.which-key.enable = lib.mkEnableOption "enables which-key module";
  };

  config = lib.mkIf config.nixvim-config.utils.which-key.enable {
    programs.nixvim.plugins = {
      which-key = {
        enable = true;
      };
    };
  };
}
