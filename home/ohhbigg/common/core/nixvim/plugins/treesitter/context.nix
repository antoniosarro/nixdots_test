{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.treesitter.context.enable = lib.mkEnableOption "enables treesitter-context module";
  };

  config = lib.mkIf config.nixvim-config.treesitter.context.enable {
    programs.nixvim.plugins = {
      treesitter-context = {
        enable = true;
      };
    };
  };
}
