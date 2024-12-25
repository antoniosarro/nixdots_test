{
  pkgs,
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.snippets.luasnip.enable = lib.mkEnableOption "enables luasnip module";
  };

  config = lib.mkIf config.nixvim-config.snippets.luasnip.enable {
    programs.nixvim.plugins = {
      luasnip = {
        enable = true;
        settings = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
        };
        fromVscode = [
          {
            lazyLoad = true;
            paths = "${pkgs.vimPlugins.friendly-snippets}";
          }
        ];
      };
    };
  };
}
