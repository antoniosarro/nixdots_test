{lib, ...}: {
  imports = lib.custom.scanPaths ./.;

  config = {
    # ============================
    # Colorscheme
    # ============================
    nixvim-config.colorschemes.enable = lib.mkDefault true;

    # ============================
    # Completion
    # ============================
    nixvim-config.completion.cmp.enable = lib.mkDefault true;
    nixvim-config.completion.schemastore.enable = lib.mkDefault true;
    nixvim-config.completion.lspkind.enable = lib.mkDefault true;

    # ============================
    # Git
    # ============================
    nixvim-config.git.gitlinker.enable = lib.mkDefault true;
    nixvim-config.git.gitsigns.enable = lib.mkDefault true;
    nixvim-config.git.lazygit.enable = lib.mkDefault true;

    # ============================
    # Lsp
    # ============================
    nixvim-config.lsp.conform.enable = lib.mkDefault true;
    nixvim-config.lsp.fidget.enable = lib.mkDefault true;
    nixvim-config.lsp.lsp.enable = lib.mkDefault true;
    nixvim-config.lsp.lspsaga.enable = lib.mkDefault true;
    nixvim-config.lsp.none-ls.enable = lib.mkDefault true;
    nixvim-config.lsp.trouble.enable = lib.mkDefault true;

    # ============================
    # Snippets
    # ============================
    nixvim-config.snippets.luasnip.enable = lib.mkDefault true;

    # ============================
    # Statusline
    # ============================
    nixvim-config.statusline.lualine.enable = lib.mkDefault true;

    # ============================
    # Treesitter
    # ============================
    nixvim-config.treesitter.context.enable = lib.mkDefault true;
    nixvim-config.treesitter.textobjects.enable = lib.mkDefault true;
    nixvim-config.treesitter.enable = lib.mkDefault true;

    # ============================
    # Utils
    # ============================
    nixvim-config.utils.colorizer.enable = lib.mkDefault true;
    nixvim-config.utils.comment-box.enable = lib.mkDefault true;
    nixvim-config.utils.comment.enable = lib.mkDefault true;
    nixvim-config.utils.grapple.enable = lib.mkDefault true;
    nixvim-config.utils.hardtime.enable = lib.mkDefault true;
    nixvim-config.utils.illuminate.enable = lib.mkDefault true;
    nixvim-config.utils.markview.enable = lib.mkDefault true;
    nixvim-config.utils.mini.enable = lib.mkDefault true;
    nixvim-config.utils.tree.enable = lib.mkDefault true;
    nixvim-config.utils.ufo.enable = lib.mkDefault true;
    nixvim-config.utils.undotree.enable = lib.mkDefault true;
    nixvim-config.utils.wakatime.enable = lib.mkDefault true;
    nixvim-config.utils.which-key.enable = lib.mkDefault true;

    # ============================
    # UI
    # ============================
    nixvim-config.ui.alpha.enable = lib.mkDefault true;
    nixvim-config.ui.bufferline.enable = lib.mkDefault true;
    nixvim-config.ui.colorizer.enable = lib.mkDefault true;
    nixvim-config.ui.dressing.enable = lib.mkDefault true;
    nixvim-config.ui.indent-blankline.enable = lib.mkDefault true;
    nixvim-config.ui.noice.enable = lib.mkDefault true;
    nixvim-config.ui.presence-nvim.enable = lib.mkDefault true;
    nixvim-config.ui.telescope.enable = lib.mkDefault true;
    nixvim-config.ui.web-devicons.enable = lib.mkDefault true;
  };
}
