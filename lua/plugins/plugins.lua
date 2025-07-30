-- These are my custom plugins
local plugins = {
  {
    "linux-cultist/venv-selector.nvim",
      dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
      },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
        require("venv-selector").setup()
      end,
      keys = {
        { ",v", "<cmd>VenvSelect<cr>" },
      },
  },
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
      "html"
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
  'Exafunction/windsurf.vim',
  event = 'BufEnter'
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
        "clangd"
      }
    }
  },
}

return plugins
