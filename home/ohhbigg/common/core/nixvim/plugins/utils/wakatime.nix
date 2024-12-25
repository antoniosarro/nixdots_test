{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.utils.wakatime.enable = lib.mkEnableOption "enables wakatime module";
  };

  config = lib.mkIf config.nixvim-config.utils.wakatime.enable {
    programs.nixvim.plugins = {
      wakatime = {
        enable = true;
      };
    };
  };
}
