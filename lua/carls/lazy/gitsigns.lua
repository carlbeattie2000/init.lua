return {
  "lewis6991/gitsigns.nvim",
  tag = "v1.0.2",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('gitsigns').setup {
      signs = {
        untracked = { text = "┆" }
      },
      attach_to_untracked = true
    }
  end,
}
