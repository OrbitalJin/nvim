require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Unmap for terminal vertical split
map("n", "<leader>v", ":VenvSelect <cr>", {desc = "VenvSelect Menu"})

-- Copilot
map("i", "<C-l>", function ()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", noremap = true, silent = true })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Disable arrow keys 
-- map({ "n", "v", "i", "x" }, "<Up>", "<Nop>")
-- map({ "n", "v", "i", "x" }, "<Down>", "<Nop>")
-- map({ "n", "v", "i", "x" }, "<Left>", "<Nop>")
-- map({ "n", "v", "i", "x" }, "<Right>", "<Nop>")
