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
    config = function()
      require("codeium").setup {
        virtual_text = {
          enabled = true,
          idle_delay = 50,
          key_bindings = {
            accept = "<M-\\>",
          },
        },
      }
    end,
  },
  {
    "davidmh/mdx.nvim",
    config = true,
    event = "BufEnter *.mdx",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = 'latexrun'
      vim.g.vimtex_compiler_continuous = 1
      -- vim.g.vimtex_quickfix_mode = 1
      -- dump build files in dedicated directory
      vim.g.vimtex_compiler_latexrun = {
        executable = "latexrun",
        options = { "-Wall" },
        out_dir = "build",
      }
    end
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
