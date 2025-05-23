-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = { theme = "nord" }

M.plugins = "custom.plugins"

M.nvdash = {
  load_on_startup = true,
}

return M
