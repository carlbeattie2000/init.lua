vim.g.mapleader = " "

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Normal Mode" })

vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<CR>", { desc = "Restart Lsp" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format Buffer" })

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>", { desc = "Goto next quick fix" })
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>", { desc = "Goto previous quick fix" })

vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "Source Current Buffer" })
