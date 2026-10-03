-- These are my custom plugins
local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.custom.null-ls"
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
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
    "milanglacier/minuet-ai.nvim",
    event = "InsertEnter",
    dependencies = { "nvim-cmp" },
    config = function()
      require("minuet").setup {
        provider = "openai_compatible",
        -- deepseek-v4-flash is a reasoning model; thinking is disabled below
        -- to keep inline completions fast and cheap.
        request_timeout = 2.5,
        throttle = 100,
        debounce = 400,
        n_completions = 1,
        context_window = 8000,
        notify = "warn",
        provider_options = {
          openai_compatible = {
            -- Name of the env var, not the value. Loaded from ~/.config/nvim/.env
            api_key = "AI_GATEWAY_API_KEY",
            end_point = "https://ai-gateway.vercel.sh/v1/chat/completions",
            model = "deepseek/deepseek-v4-flash",
            name = "Vercel AI Gateway",
            stream = true,
            optional = {
              max_tokens = 128,
              top_p = 0.9,
              -- Vercel AI Gateway expects `reasoning` as an object. This model
              -- reports an `effort` control with values none|low|medium|high.
              reasoning = { effort = "none" },
            },
          },
        },
        virtualtext = {
          auto_trigger_ft = { "*" },
          keymap = {
            accept = "<M-\\>",
            accept_line = "<M-a>",
            accept_n_lines = "<M-z>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<M-e>",
          },
        },
      }
    end,
  },
  {
    -- Register Minuet as an nvim-cmp source. Merged into NvChad's cmp config,
    -- so the existing keymaps/snippets are preserved.
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, 1, { name = "minuet" })
      opts.performance = vim.tbl_deep_extend("force", opts.performance or {}, {
        fetching_timeout = 2000,
      })
    end,
  },
  {
    "NickvanDyke/opencode.nvim",
    lazy = false,
    dependencies = {
      { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
    },
    config = function()
      vim.o.autoread = true

      -- Recommended/example keymaps.
      vim.keymap.set({ "n", "x" }, "<leader>o", function()
        require("opencode").select()
      end, { desc = "Execute opencode action…" })

      vim.keymap.set({ "n", "t" }, "<C-.>", function()
        require("opencode").toggle()
      end, { desc = "Toggle opencode" })

      vim.keymap.set("n", "<S-C-u>", function()
        require("opencode").command "session.half.page.up"
      end, { desc = "opencode half page up" })

      vim.keymap.set("n", "<S-C-d>", function()
        require("opencode").command "session.half.page.down"
      end, { desc = "opencode half page down" })
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    ft = "python",
    opts = {
      search = {}, -- if you add your own searches, they go here.
      options = {}, -- if you add plugin options, they go here.
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
          "-outdir=.", -- PDF stays in project root
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
