require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Unmap for terminal vertical split
map("n", "<leader>v", ":VenvSelect <cr>", {desc = "VenvSelect Menu"})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
