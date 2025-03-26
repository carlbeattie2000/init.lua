local M = {}

local autocmd = vim.api.nvim_create_autocmd
local LspGroup = vim.api.nvim_create_augroup("lsp_custom_fn_group", {})

M.on_attach = {}

M.on_attach.setup = function()
	autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("LspCustomGroup", {}),
		callback = function(e)
			for _, fn in pairs(M.on_attach) do
				fn(e)
			end
		end,
	})
end

M.on_attach.inlay_hints = function(e)
	local client = vim.lsp.get_client_by_id(e.data.client_id)
	if not client then
		return
	end

	if not client.supports_method("textDocument/inlayHint") then
		return
	end

	autocmd("InsertEnter", {
		group = LspGroup,
		buffer = e.buf,
		callback = function()
			vim.lsp.inlay_hint.enable(true)
		end,
	})

	autocmd("InsertLeave", {
		group = LspGroup,
		buffer = e.buf,
		callback = function()
			vim.lsp.inlay_hint.enable(false)
		end,
	})
end

M.on_attach.format_on_save = function(e)
	local client = vim.lsp.get_client_by_id(e.data.client_id)
	if not client then
		return
	end

	if client.supports_method("textDocument/formatting") then
		autocmd("BufWritePre", {
			group = LspGroup,
			buffer = e.buf,
			callback = function()
				local formattedWithConform = require("conform").format({ bufnr = e.buf })

				if not formattedWithConform then
					vim.lsp.buf.format({ bufnr = e.buf, id = client.id })
				end
			end,
		})
	end
end

M.on_attach.keybinds = function(e)
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, { buffer = e.buf, desc = "Goto definition" })
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, { buffer = e.buf, desc = "Displays information about the symbol under cursor" })
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()()
	end, { buffer = e.buf, desc = "List all symbols in current workspace in quickfix window" })
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, { buffer = e.buf, desc = "Show diagnostics in floating window" })
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, { buffer = e.buf, desc = "Selects a code action available at the current cursor position" })
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, { buffer = e.buf, desc = "List all references to the current symbol under the cursor in the quickfix window" })
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, { buffer = e.buf, desc = "Renames all references to the symbol under the cursor." })
	vim.keymap.set("n", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, { buffer = e.buf, desc = "List all references to the current symbol under the cursor in the quickfix window" })
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.jump({ count = 1, float = true })
	end, { buffer = e.buf, desc = "Goto next diagnostics" })
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.jump({ count = -1, float = true })
	end, { buffer = e.buf, desc = "Goto previous diagnostics" })

	-- Pulled this one from TJ
	vim.keymap.set("", "<leader>l", function()
		local config = vim.diagnostic.config() or {}
		vim.print(config)
		if config.virtual_text then
			vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
		else
			vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
		end
	end, { desc = "Toggle lsp_lines" })
end

return M
