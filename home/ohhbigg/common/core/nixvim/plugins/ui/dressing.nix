{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.ui.dressing.enable = lib.mkEnableOption "enables dressing module";
  };

  config = lib.mkIf config.nixvim-config.ui.dressing.enable {
    programs.nixvim.plugins = {
      dressing = {
        enable = true;
        settings = {
          input = {
            relative = "win";
          };
          select = {
            backend = ["telescope"];
          };
        };
      };
    };
  };
}
