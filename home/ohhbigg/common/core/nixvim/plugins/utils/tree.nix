{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.utils.tree.enable = lib.mkEnableOption "enables tree module";
  };

  config = lib.mkIf config.nixvim-config.utils.tree.enable {
    programs.nixvim.plugins = {
      neo-tree.enable = true;
      oil = {
        enable = true;
        settings = {
          default_file_explorer = false;
          skip_confirm_for_simple_edits = true;
          win_options = {
            concealcursor = "ncv";
            conceallevel = 3;
            cursorcolumn = false;
            foldcolumn = "0";
            list = false;
            signcolumn = "no";
            spell = false;
            wrap = false;
          };
          float = {padding = 5;};
          keymaps = {
            "-" = "actions.parent";
            "b" = "actions.parent";
            "<C-c>" = "actions.close";
            "<C-h>" = "actions.select_split";
            "<C-l>" = "actions.refresh";
            "<C-p>" = "actions.preview";
            "<C-s>" = "actions.select_vsplit";
            "<C-t>" = "actions.select_tab";
            "<CR>" = "actions.select";
            _ = "actions.open_cwd";
            "`" = "actions.cd";
            "g." = "actions.toggle_hidden";
            "g?" = "actions.show_help";
            "g\\" = "actions.toggle_trash";
            gs = "actions.change_sort";
            gx = "actions.open_external";
            "~" = "actions.tcd";
          };
        };
      };
    };
    programs.nixvim.keymaps = [
      {
        key = "-";
        action = "<cmd>Oil<cr>";
        options.desc = "Oil";
      }
      {
        key = "<leader>e";
        action = "<cmd>Oil --float<cr>";
        options.desc = "Oil";
      }
      {
        key = "<leader>E";
        action = "<cmd>Neotree toggle<cr>";
        options.desc = "Neotree";
      }
    ];
  };
}
