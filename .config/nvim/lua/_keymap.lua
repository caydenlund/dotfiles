vim.keymap.set({"n", "v"}, "<leader><leader>", "@q", { desc = "Double-tap leader key to execute macro `@q`." })

vim.keymap.set("v", "<leader>c", "\"+y", { desc = "Copy the selected text to the clipboard." })
vim.keymap.set("n", "<leader>.", ":noh<cr>", { desc = "Stop highlighting search matches." })
vim.keymap.set("n", "<leader>l", "/.\\{80\\}<cr>", { desc = "Search for lines over 80 chars." })
vim.keymap.set("n", "<leader>t", "/TODO<cr>", { desc = "Search for TODO comments." })
vim.keymap.set("n", "<leader>f", ":lua vim.lsp.buf.format { async = true }<cr>", { desc = "Format the file." })
vim.keymap.set("t", "<esc>", "<c-\\><c-n>", { desc = "Switch to normal mode." })

vim.fn.setreg("u", "kdw")
vim.fn.setreg("d", "jdw")

