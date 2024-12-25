{
  config,
  lib,
  ...
}: {
  options = {
    nixvim-config.lsp.conform.enable = lib.mkEnableOption "enables conform module";
  };

  config = lib.mkIf config.nixvim-config.lsp.conform.enable {
    programs.nixvim.plugins = {
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lspFallback = true;
            timeoutMs = 500;
          };
          notify_on_error = true;

          formatters_by_ft = {
            html = [
              [
                "prettier"
              ]
            ];
            css = [
              [
                "prettier"
              ]
            ];
            scss = [
              [
                "prettier"
              ]
            ];
            javascript = [
              [
                "prettier"
              ]
            ];
            javascriptreact = [
              [
                "prettier"
              ]
            ];
            typescript = [
              [
                "prettier"
              ]
            ];
            typescriptreact = [
              [
                "prettier"
              ]
            ];
            python = ["black"];
            lua = ["stylua"];
            nix = ["alejandra"];
            markdown = [
              [
                "prettier"
              ]
            ];
            yaml = [
              "yamllint"
              "yamlfmt"
            ];
            go = ["goimports" "gofmt"];
            rust = ["rustfmt"];
            svelte = [
              "prettier"
              "rustywind"
            ];
            shellscript = ["shellcheck" "shfmt"];
          };
        };
      };
    };
  };
}
