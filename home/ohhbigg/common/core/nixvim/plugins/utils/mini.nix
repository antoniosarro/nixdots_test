{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.utils.mini.enable = lib.mkEnableOption "enables mini module";
  };

  config = lib.mkIf config.nixvim-config.utils.mini.enable {
    programs.nixvim.plugins = {
      mini = {
        enable = true;
        modules = {
          ai = {};
          icons = {};
          notify = {};
          pairs = {};
          surround = {};
          tabline = {};
          trailspace = {};
        };
      };
    };
  };
}
