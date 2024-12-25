{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.utils.comment-box.enable = lib.mkEnableOption "enables comment-box module";
  };

  config = lib.mkIf config.nixvim-config.utils.comment-box.enable {
    programs.nixvim.plugins = {
      comment-box = {
        enable = true;
      };
    };
  };
}
