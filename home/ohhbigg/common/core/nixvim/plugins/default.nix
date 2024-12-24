{lib, ...}: {
  imports = lib.custom.scanPaths ./.;

  config = {
    # ============================
    # UI
    # ============================
    nixvim-config.ui.alpha.enable = lib.mkDefault true;
    nixvim-config.ui.bufferline.enable = lib.mkDefault true;
    nixvim-config.ui.colorizer.enable = lib.mkDefault true;
    nixvim-config.colorschemes.enable = lib.mkDefault true;
    nixvim-config.ui.dressing.enable = lib.mkDefault true;
    nixvim-config.ui.indent-blankline.enable = lib.mkDefault true;
    nixvim-config.ui.noice.enable = lib.mkDefault true;
    nixvim-config.ui.presence-nvim.enable = lib.mkDefault true;
  };
}
