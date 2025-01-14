{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.lsp.none-ls.enable = lib.mkEnableOption "enables none-ls module";
  };

  config = lib.mkIf config.nixvim-config.lsp.none-ls.enable {
    programs.nixvim.plugins = {
      none-ls = {
        enable = true;
        enableLspFormat = true;
        settings = {
          updateInInsert = false;
        };
        sources = {
          code_actions = {
            gitsigns.enable = true;
            statix.enable = true;
          };
          diagnostics = {
            statix.enable = true;
            yamllint.enable = true;
          };
          formatting = {
            nixpkgs_fmt.enable = true;
            black = {
              enable = true;
              settings = ''
                {
                  extra_args = { "--fast" },
                }
              '';
            };
            prettier = {
              enable = true;
              disableTsServerFormatter = true;
              settings = ''
                {
                  extra_args = { "--no-semi", "--single-quote" },
                }
              '';
            };
            stylua.enable = true;
            yamlfmt.enable = true;
            hclfmt.enable = true;
          };
        };
      };
    };
    programs.nixvim.keymaps = [
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>cf";
        action = "<cmd>lua vim.lsp.buf.format()<cr>";
        options = {
          silent = true;
          desc = "Format";
        };
      }
    ];
  };
}
