-- My lspconfig
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- Define the servers
local servers = {
  "html",
  "cssls",
  "tailwindcss",
  "ts_ls",
  "eslint",
  "pyright",
  "gopls",
  "clangd",
}

-- Iterate over servers and init their respective lsps
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- necessary to boostrap the arduino lsp
local MY_FQBN = "arduino:avr:nano:cpu=atmega328old"
lspconfig.arduino_language_server.setup {
  cmd = {
    "arduino-language-server",
    "-cli-config",
    "/path/to/arduino-cli.yaml",
    "-fqbn",
    MY_FQBN,
  },
}
