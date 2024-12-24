{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.ui.colorschemes.enable = lib.mkEnableOption "enables colorschemes module";
  };

  config = lib.mkIf config.nixvim-config.ui.colorschemes.enable {
    programs.nixvim = {
      colorschemes = {
        base16 = {
          enable = true;
          setUpBar = false;
          colorscheme = {
            base00 = "#" + config.hostSpec.theme.colors.base00;
            base01 = "#" + config.hostSpec.theme.colors.base01;
            base02 = "#" + config.hostSpec.theme.colors.base02;
            base03 = "#" + config.hostSpec.theme.colors.base03;
            base04 = "#" + config.hostSpec.theme.colors.base04;
            base05 = "#" + config.hostSpec.theme.colors.base05;
            base06 = "#" + config.hostSpec.theme.colors.base06;
            base07 = "#" + config.hostSpec.theme.colors.base07;
            base08 = "#" + config.hostSpec.theme.colors.base08;
            base09 = "#" + config.hostSpec.theme.colors.base09;
            base0A = "#" + config.hostSpec.theme.colors.base0A;
            base0B = "#" + config.hostSpec.theme.colors.base0B;
            base0C = "#" + config.hostSpec.theme.colors.base0C;
            base0D = "#" + config.hostSpec.theme.colors.base0D;
            base0E = "#" + config.hostSpec.theme.colors.base0E;
            base0F = "#" + config.hostSpec.theme.colors.base0F;
          };
        };
      };
    };
  };
}
