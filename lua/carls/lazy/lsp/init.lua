local config = require 'carls.lazy.lsp.config'
local options = require 'carls.lazy.lsp.options'

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { import = "carls.lazy.lsp.lazy-dev" },
      { import = "carls.lazy.lsp.blink-cmp" },
      { import = "carls.lazy.lsp.snippets" },
      "folke/lazydev.nvim",
      "j-hui/fidget.nvim",
      "stevearc/conform.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = options,
    config = config.setup,
  },
}
