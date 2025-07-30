require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Unmap for terminal vertical split
map("n", "<leader>v", ":VenvSelect <cr>", {desc = "VenvSelect Menu"})

-- Codeium
vim.api.nvim_set_keymap("i", "<C-l>", "codeium#Accept()", {
  expr = true,         -- This is important! Tells Neovim to evaluate the string as an expression.
  noremap = true,
  silent = true,
  desc = "Codeium Accept",
})

-- restart lsp
map("n", "<leader>l", ":LspRestart <cr>", {desc = "Restart LSP"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Disable arrow keys 
-- map({ "n", "v", "i", "x" }, "<Up>", "<Nop>")
-- map({ "n", "v", "i", "x" }, "<Down>", "<Nop>")
-- map({ "n", "v", "i", "x" }, "<Left>", "<Nop>")
-- map({ "n", "v", "i", "x" }, "<Right>", "<Nop>")
