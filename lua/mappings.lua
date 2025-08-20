require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Unmap for terminal vertical split
map("n", "<leader>v", ":VenvSelect <cr>", {desc = "VenvSelect Menu"})

-- restart lsp
map("n", "<leader>l", ":LspRestart <cr>", {desc = "Restart LSP"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Disable arrow keys 
-- map({ "n", "v", "i", "x" }, "<Up>", "<Nop>")
-- map({ "n", "v", "i", "x" }, "<Down>", "<Nop>")
-- map({ "n", "v", "i", "x" }, "<Left>", "<Nop>")
-- map({ "n", "v", "i", "x" }, "<Right>", "<Nop>")
