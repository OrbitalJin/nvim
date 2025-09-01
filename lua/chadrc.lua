-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = { theme = "gruvbox" }

M.plugins = "custom.plugins"
-- In your chadrc.lua or a custom plugin file
M.lazy.extras = {
  "nvim-treesitter-context", -- Add this line to enable the extra
  -- ... other extras
}

M.nvdash = {
  load_on_startup = true,
}

return M
