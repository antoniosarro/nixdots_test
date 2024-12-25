{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.completion.lspkind.enable = lib.mkEnableOption "enables lspkind module";
  };

  config = lib.mkIf config.nixvim-config.completion.lspkind.enable {
    programs.nixvim.plugins = {
      lspkind = {
        enable = true;
        extraOptions = {
          maxwidth = 50;
          ellipsis_char = "...";
        };
      };
    };
  };
}
