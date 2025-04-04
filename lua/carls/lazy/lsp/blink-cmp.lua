return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets", { "L3MON4D3/LuaSnip", version = "v2.*" } },
	version = "v1.*",
	opts = {
		completion = {
			accept = { auto_brackets = { enabled = false } },
			documentation = {
				auto_show = false,
				treesitter_highlighting = true,
				window = { border = "rounded" },
			},
		},
		keymap = {
			preset = "default",
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		signature = { enabled = true },
	},
}
