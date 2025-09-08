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
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    ft = "python",
    keys = {
      { "<leader>v", "<cmd>VenvSelect<cr>" },
    },
    opts = {
        search = {}, -- if you add your own searches, they go here.
        options = {} -- if you add plugin options, they go here.
    },
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-pdf", -- build PDF
          "-pdflatex=pdflatex -synctex=1 -interaction=nonstopmode",
          "-interaction=nonstopmode",
          "-shell-escape",
          "-synctex=1",
          "-auxdir=build", -- aux files go here
          "-outdir=.",     -- PDF stays in project root
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
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
