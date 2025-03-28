return {
	"folke/trouble.nvim",
	config = function()
		local trouble = require("trouble")
		trouble.setup()

		vim.keymap.set("n", "<leader>tt", function()
			trouble.toggle("diagnostics")
		end, { desc = "Toggle trouble" })
		vim.keymap.set("n", "[t", function()
			trouble.next({
				skip_groups = true,
				jump = true,
				mode = "diagnostics",
			})
		end, { desc = "Goto next diagnostic message" })
		vim.keymap.set("n", "]t", function()
			trouble.prev({
				skip_groups = true,
				jump = true,
				mode = "diagnostics",
			})
		end, { desc = "Goto previous diagnostic message" })
	end,
}
