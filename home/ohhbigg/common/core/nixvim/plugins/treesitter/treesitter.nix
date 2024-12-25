{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.treesitter.enable = lib.mkEnableOption "enables treesitter module";
  };

  config = lib.mkIf config.nixvim-config.treesitter.enable {
    programs.nixvim.plugins = {
      treesitter = {
        enable = true;
        settings = {
          indent = {
            enable = true;
          };
          highlight = {
            enable = true;
          };
        };

        folding = true;
        nixvimInjections = true;
        grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
      };
    };
  };
}
