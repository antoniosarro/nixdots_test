{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.git.lazygit.enable = lib.mkEnableOption "enables lazygit module";
  };

  config = lib.mkIf config.nixvim-config.git.lazygit.enable {
    programs.nixvim.plugins = {
      lazygit = {
        enable = true;
      };
    };
    programs.nixvim = {
      extraConfigLua = ''
        require("telescope").load_extension("lazygit")
      '';

      keymaps = [
        {
          mode = "n";
          key = "<leader>gg";
          action = "<cmd>LazyGit<CR>";
          options = {
            desc = "LazyGit (root dir)";
          };
        }
      ];
    };
  };
}
