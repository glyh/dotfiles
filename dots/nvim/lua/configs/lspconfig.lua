local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "clangd",
  "zls",
  "gopls",
  "rust_analyzer",
  "pyright",
  "typst_lsp",
  -- 'dartls', -- other plugin sets up dart for me
  "ocamllsp",
  "ruby_lsp",
  "rubocop",
  -- "sorbet",
  "cmake",
  -- "gleam",
  -- "kotlin_language_server",
  "glsl_analyzer",
  "glasgow",
  -- "hls", -- use haskell-tools.nvim instead
  "eslint",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.elixirls.setup {
  -- Unix
  cmd = { "elixir-ls" },
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.crystalline.setup {
  cmd = { "crystalline", "--stdio" },
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}
