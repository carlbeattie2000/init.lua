return {
	{
		"neovim/nvim-lspconfig",
		tag = "v1.7.0",
		dependencies = {
			{ import = "carls.lazy.lsp.lazy-dev" },
			{ import = "carls.lazy.lsp.blink-cmp" },
			{ import = "carls.lazy.lsp.snippets" },
			"folke/lazydev.nvim",
			"j-hui/fidget.nvim",
			"stevearc/conform.nvim",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		},
		opts = require("carls.lazy.lsp.options"),
		config = require("carls.lazy.lsp.config").setup,
	},
}
