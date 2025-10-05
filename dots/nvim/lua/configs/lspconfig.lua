local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

vim.lsp.set_log_level "debug"

vim.lsp.config("ocamllsp", {
  filetypes = { "ocaml", "ocaml.menhir", "ocamlinterface", "dune" },
})

vim.lsp.config("raku_navigator", {
  cmd = { "node", "/home/lyh/pullground/RakuNavigator/server/out/server.js", "--stdio" },
})

-- if you just want default config for the servers then put them in a table
local servers = {
  "clangd",
  "zls",
  "gopls",
  "postgres_lsp",
  "ts_ls",
  -- "csharp_ls",
  -- "rust_analyzer",
  -- "pyright",
  -- "tinymist",
  -- "cmake",
  -- "gleam",
  -- "kotlin_language_server",
  -- "glsl_analyzer",
  -- "glasgow",
  -- "hls", -- use haskell-tools.nvim instead
  "eslint",
  -- "mlir_lsp_server",
  -- "bashls",
  -- "dhall_lsp_server",
  "ocamllsp",
  "rubocop",
}

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
  vim.lsp.enable(lsp)
end
