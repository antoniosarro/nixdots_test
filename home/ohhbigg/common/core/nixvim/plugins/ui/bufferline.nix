{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.ui.bufferline.enable = lib.mkEnableOption "enables bufferline module";
  };

  config = lib.mkIf config.nixvim-config.ui.bufferline.enable {
    programs.nixvim = {
      plugins = {
        bufferline = {
          enable = false;
          settings = {
            options = {
              separator_style = "thin"; # “slant”, “padded_slant”, “slope”, “padded_slope”, “thick”, “thin”
            };
            highlights = {
              fill = {
                fg = "none";
                bg = "none";
              };
              background = {
                fg = config.hostSpec.theme.colors.base03;
                bg = config.hostSpec.theme.colors.base01;
              };
              buffer_selected = {
                fg = config.hostSpec.theme.colors.base05;
                italic = false;
              };
              buffer_visible = {
                fg = config.hostSpec.theme.colors.base03;
                bg = config.hostSpec.theme.colors.base00;
              };
              close_button = {
                fg = config.hostSpec.theme.colors.base03;
                bg = config.hostSpec.theme.colors.base01;
              };
              close_button_visible = {
                fg = config.hostSpec.theme.colors.base03;
                bg = config.hostSpec.theme.colors.base01;
              };
              close_button_selected = {
                fg = config.hostSpec.theme.colors.base08;
              };

              indicator_selected = {
                fg = config.hostSpec.theme.colors.base00;
              };
              indicator_visible = {
                fg = config.hostSpec.theme.colors.base00;
                bg = config.hostSpec.theme.colors.base00;
              };
              separator = {
                fg = config.hostSpec.theme.colors.base01;
                bg = config.hostSpec.theme.colors.base01;
              };
              modified = {
                fg = config.hostSpec.theme.colors.base03;
                bg = config.hostSpec.theme.colors.base00;
              };
              modified_visible = {
                fg = config.hostSpec.theme.colors.base00;
                bg = config.hostSpec.theme.colors.base00;
              };
              modified_selected = {
                fg = config.hostSpec.theme.colors.base0B;
              };
              tab_close = {
                fg = config.hostSpec.theme.colors.base00;
                bg = config.hostSpec.theme.colors.base00;
              };
              duplicate = {
                fg = config.hostSpec.theme.colors.base03;
                bg = config.hostSpec.theme.colors.base01;
              };
            };
          };
        };
      };
      keymaps = [
        {
          mode = "n";
          key = "<Tab>";
          action = "<cmd>BufferLineCycleNext<cr>";
          options = {
            desc = "Cycle to next buffer";
          };
        }

        {
          mode = "n";
          key = "<S-Tab>";
          action = "<cmd>BufferLineCyclePrev<cr>";
          options = {
            desc = "Cycle to previous buffer";
          };
        }

        {
          mode = "n";
          key = "<S-l>";
          action = "<cmd>BufferLineCycleNext<cr>";
          options = {
            desc = "Cycle to next buffer";
          };
        }

        {
          mode = "n";
          key = "<S-h>";
          action = "<cmd>BufferLineCyclePrev<cr>";
          options = {
            desc = "Cycle to previous buffer";
          };
        }

        {
          mode = "n";
          key = "<leader>bd";
          action = "<cmd>bdelete<cr>";
          options = {
            desc = "Delete buffer";
          };
        }

        {
          mode = "n";
          key = "<leader>bb";
          action = "<cmd>e #<cr>";
          options = {
            desc = "Switch to Other Buffer";
          };
        }

        # {
        #   mode = "n";
        #   key = "<leader>`";
        #   action = "<cmd>e #<cr>";
        #   options = {
        #     desc = "Switch to Other Buffer";
        #   };
        # }

        {
          mode = "n";
          key = "<leader>br";
          action = "<cmd>BufferLineCloseRight<cr>";
          options = {
            desc = "Delete buffers to the right";
          };
        }

        {
          mode = "n";
          key = "<leader>bl";
          action = "<cmd>BufferLineCloseLeft<cr>";
          options = {
            desc = "Delete buffers to the left";
          };
        }

        {
          mode = "n";
          key = "<leader>bo";
          action = "<cmd>BufferLineCloseOthers<cr>";
          options = {
            desc = "Delete other buffers";
          };
        }

        {
          mode = "n";
          key = "<leader>bp";
          action = "<cmd>BufferLineTogglePin<cr>";
          options = {
            desc = "Toggle pin";
          };
        }

        {
          mode = "n";
          key = "<leader>bP";
          action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
          options = {
            desc = "Delete non-pinned buffers";
          };
        }
      ];
    };
  };
}
