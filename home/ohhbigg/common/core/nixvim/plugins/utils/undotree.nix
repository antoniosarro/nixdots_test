{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.utils.undotree.enable = lib.mkEnableOption "enables undotree module";
  };

  config = lib.mkIf config.nixvim-config.utils.undotree.enable {
    programs.nixvim.plugins = {
      undotree = {
        enable = true;
        settings = {
          autoOpenDiff = true;
          focusOnToggle = true;
        };
      };
    };
    programs.nixvim.keymaps = [
      {
        mode = "n";
        key = "<leader>ut";
        action = "<cmd>UndotreeToggle<CR>";
        options = {
          silent = true;
          desc = "Undotree";
        };
      }
    ];
  };
}
