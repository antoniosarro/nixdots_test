{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.utils.comment.enable = lib.mkEnableOption "enables comment module";
  };

  config = lib.mkIf config.nixvim-config.utils.comment.enable {
    programs.nixvim.plugins = {
      comment = {
        enable = true;
      };
    };
  };
}
