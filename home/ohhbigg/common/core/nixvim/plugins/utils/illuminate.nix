{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.utils.illuminate.enable = lib.mkEnableOption "enables illuminate module";
  };

  config = lib.mkIf config.nixvim-config.utils.illuminate.enable {
    programs.nixvim.plugins = {
      illuminate = {
        enable = true;
        underCursor = false;
        filetypesDenylist = [
          "Outline"
          "TelescopePrompt"
          "alpha"
          "reason"
        ];
      };
    };
  };
}
