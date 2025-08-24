local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- if you just want default config for the servers then put them in a table
local servers = {
  "clangd",
  "zls",
  "gopls",
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
  -- "eslint",
  --
  -- "mlir_lsp_server",
  --
  -- "bashls",
  --
  -- "dhall_lsp_server",
}

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  })
end

vim.lsp.enable "ocamllsp"
vim.lsp.config("ocamllsp", {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "ocaml", "ocaml.menhir", "ocamlinterface", "dune" },
})
