return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            theme = "ivy",
          }
        },
        extensions = {
          fzf = {}
        }
      }

      require('telescope').load_extension('fzf')

      local telescope_builtin = require 'telescope.builtin'

      vim.keymap.set("n", "<leader>vh", telescope_builtin.help_tags, { desc = "Show help tags" })
      vim.keymap.set("n", "<leader>fd", telescope_builtin.find_files, { desc = "Find Files In Current Directory" })
      vim.keymap.set("n", "<leader>en", function()
        telescope_builtin.find_files {
          cwd = vim.fn.stdpath("config")
        }
      end, { desc = "Find Files In Neovim Config Directory" })

      vim.keymap.set("n", "<leader>ep", function()
        telescope_builtin.find_files {
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end)

      require("carls.lazy.telescope.multigrep").setup()
    end
  }
}
