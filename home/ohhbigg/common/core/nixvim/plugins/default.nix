{lib, ...}: {
  imports = lib.custom.scanPaths ./.;

  config = {
    # ============================
    # UI
    # ============================
    nixvim-config.colorschemes.enable = lib.mkDefault true;
    nixvim-config.ui.nvim-colorizer.enable = lib.mkDefault true;
  };
}
