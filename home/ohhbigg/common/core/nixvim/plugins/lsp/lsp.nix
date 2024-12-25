{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.lsp.lsp.enable = lib.mkEnableOption "enables lsp module";
  };

  config = lib.mkIf config.nixvim-config.lsp.lsp.enable {
    programs.nixvim.plugins = {
      lsp-format = {
        enable = true;
      };
      lsp = {
        enable = true;
        servers = {
          html = {
            enable = true;
          };
          lua_ls = {
            enable = true;
          };
          nil_ls = {
            enable = true;
          };
          nixd = {
            enable = true;
          };
          marksman = {
            enable = true;
          };
          pyright = {
            enable = true;
          };
          gopls = {
            enable = true;
          };
          yamlls = {
            enable = true;
          };
          bashls = {
            enable = true;
          };
          svelte = {
            enable = true;
          };
          cssls = {
            enable = true;
          };
          ts_ls = {
            enable = true;
          };
          tailwindcss = {
            enable = true;
          };
        };
        keymaps = {
          silent = true;
          lspBuf = {
            gd = {
              action = "definition";
              desc = "Goto Definition";
            };
            gr = {
              action = "references";
              desc = "Goto References";
            };
            gD = {
              action = "declaration";
              desc = "Goto Declaration";
            };
            gI = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            gT = {
              action = "type_definition";
              desc = "Type Definition";
            };
            K = {
              action = "hover";
              desc = "Hover";
            };
            "<leader>cw" = {
              action = "workspace_symbol";
              desc = "Workspace Symbol";
            };
            "<leader>cr" = {
              action = "rename";
              desc = "Rename";
            };
          };
          diagnostic = {
            "<leader>cd" = {
              action = "open_float";
              desc = "Line Diagnostics";
            };
            "[d" = {
              action = "goto_next";
              desc = "Next Diagnostic";
            };
            "]d" = {
              action = "goto_prev";
              desc = "Previous Diagnostic";
            };
          };
        };
      };
    };
    programs.nixvim.extraConfigLua = ''
      local _border = "rounded"

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover, {
          border = _border
        }
      )

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
        vim.lsp.handlers.signature_help, {
          border = _border
        }
      )

      vim.diagnostic.config{
        float={border=_border}
      };

      require('lspconfig.ui.windows').default_options = {
        border = _border
      }
    '';
  };
}
