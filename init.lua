vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- Load local secrets (e.g. AI_GATEWAY_API_KEY) from ~/.config/nvim/.env
-- Existing shell environment variables take precedence.
do
  local env_path = vim.fn.stdpath "config" .. "/.env"
  if vim.fn.filereadable(env_path) == 1 then
    for _, line in ipairs(vim.fn.readfile(env_path)) do
      local key, val = line:match "^%s*([%w_]+)%s*=%s*(.-)%s*$"
      if key and val ~= "" and vim.env[key] == nil then
        -- strip optional surrounding quotes
        if val:sub(1, 1) == '"' and val:sub(-1) == '"' then
          val = val:sub(2, -2)
        end
        vim.env[key] = val
      end
    end
  end
end

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- my config
require('nvim-tree').setup({
  view = {
    side = "right",
  },
})

-- Transparent Background
vim.cmd([[
  hi Normal guibg=none ctermbg=none
  hi NormalNC guibg=none ctermbg=none
  hi NormalFloat guibg=none ctermbg=none
  hi SignColumn guibg=none ctermbg=none
  hi VertSplit guibg=none ctermbg=none
]])


-- kitty
local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  command = ":silent !kitty @ set-spacing padding=0",
})

autocmd("VimLeavePre", {
  command = ":silent !kitty @ set-spacing padding=14",
})
