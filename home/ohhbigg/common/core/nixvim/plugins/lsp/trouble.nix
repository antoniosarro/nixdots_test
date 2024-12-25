{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.lsp.trouble.enable = lib.mkEnableOption "enables trouble module";
  };

  config = lib.mkIf config.nixvim-config.lsp.trouble.enable {
    programs.nixvim.plugins = {
      trouble = {
        enable = true;
      };
    };
  };
}
