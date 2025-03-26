return {
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.3",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "javascript" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  }
}
