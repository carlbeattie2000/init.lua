vim.g.mapleader = " "

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Normal Mode" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "Join line below without moving cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half-page and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half-page and center" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })
vim.keymap.set("n", "=ap", "ma=ap'a", { desc = "Re-indent paragraph and return" })

vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<CR>", { desc = "Restart Lsp" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format Buffer" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Q (ex mode)" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over selection without yanking" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>", { desc = "Goto next quick fix" })
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>", { desc = "Goto previous quick fix" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location list item and center" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location list item and center" })

vim.keymap.set("n", "<C-z>", "ea", { desc = "Goes to end of word and enters insert mode" })

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end, { desc = "Source Current Buffer" })
