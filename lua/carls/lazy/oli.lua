return {
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
      require('oil').setup {}

      vim.keymap.set("n", "<leader>pv", function() vim.cmd("Oil") end, { desc = "Directory Listing" })

      vim.keymap.set("n", "<leader>pwv", function()
        vim.cmd.vnew()
        vim.cmd("Oil")
        vim.cmd.wincmd("L")
      end, { desc = "Directory Listing In New Window" })

      vim.keymap.set("n", "<leader>ptv", function()
        vim.cmd.tabnew()
        vim.cmd("Oil")
      end, { desc = "Directory Listing In New Tab" })
    end
  }
}
