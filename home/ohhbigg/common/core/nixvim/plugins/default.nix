{lib, ...}: {
  imports = lib.custom.scanPaths ./.;

  config = {
    # ============================
    # UI
    # ============================
    nixvim-config.ui.colorschemes.enable = lib.mkDefault true;
  };
}
