{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.ui.presence-nvim.enable = lib.mkEnableOption "enables presence-nvim module";
  };

  config = lib.mkIf config.nixvim-config.ui.presence-nvim.enable {
    programs.nixvim.plugins = {
      presence-nvim = {
        enable = true;
        neovimImageText = "I use Neovim (and NixOS, BTW)";
        mainImage = "file";
      };
    };
  };
}
