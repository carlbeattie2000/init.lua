return {
  "nvim-lua/plenary.nvim",
  {
    "sonar-review",
    dir = "~/personal/sonar-review",
    config = function()
      local sonar = require "sonar-review.ui"
      local sonarcmd = require "sonar-review.sonar_cmd"
      vim.keymap.set("n", "<leader>br", sonar.show_buffer_reports,
        { desc = "Show sonar-review reports for current buffer" })
      vim.keymap.set("n", "<leader>fr", sonar.show_file_reports, { desc = "Show sonar-review reports for all files" })
      vim.keymap.set("n", "<leader>fs", sonarcmd.scan, { desc = "Perform a sonar scan" })
    end
  }
}
