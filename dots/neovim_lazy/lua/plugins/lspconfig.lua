local function conf_lspconfig()
  local lspconfig = require('lspconfig')

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  lspconfig.lua_ls.setup {
    capabilities = capabilities,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            [vim.fn.stdpath "data" .. "/lazy/extensions/nvchad_types"] = true,
            [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }

  lspconfig.clojure_lsp.setup { capabilities = capabilities }
  lspconfig.clangd.setup { capabilities = capabilities }

end

return { 'neovim/nvim-lspconfig',
  config = conf_lspconfig
}
