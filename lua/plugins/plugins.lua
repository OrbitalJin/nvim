-- These are my custom plugins
local plugins = {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.custom.null-ls"
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "Exafunction/windsurf.nvim",
    event = "BufEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup {
        virtual_text = {
          enabled = true,
          idle_delay = 2000,
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "lua-language-server",
        "tailwindcss-language-server",
        "arduino-language-server",
        "eslint-lsp",
        "prettierd",
        "pyright",
        "black",
        "gopls",
        "clangd",
      },
    },
  },
}

return plugins
