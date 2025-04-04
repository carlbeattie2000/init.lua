return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
		},
		tag = "v0.9.3",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "javascript", "html", "bash" },
				ignore_install = {},
				modules = {},
				auto_install = true,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
