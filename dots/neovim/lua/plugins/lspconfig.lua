return function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  -- WARN: Copied from hrsh7th/cmp-nvim-lsp, may be updated later
  local completionItem = capabilities.textDocument.completion.completionItem
  completionItem.snippetSupport = true
  completionItem.preselectSupport = true
  completionItem.insertReplaceSupport = true
  completionItem.labelDetailsSupport = true
  completionItem.deprecatedSupport = true
  completionItem.commitCharactersSupport = true
  completionItem.tagSupport = { valueSet = { 1 } }
  completionItem.resolveSupport = {
    properties = {
      'documentation',
      'detail',
      'additionalTextEdits',
    }
  }

  local configs = require('lspconfig.configs')
  local util = require('lspconfig.util')
  local lspconfig = require('lspconfig')
  -- local lsputil = require('lspconfig.util')

  -- lspconfig.cl_lsp.setup{ capabilities = capabilities }

  lspconfig.clangd.setup{ capabilities = capabilities }

  lspconfig.rust_analyzer.setup{ capabilities = capabilities }

  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')

  lspconfig.lua_ls.setup {
    cmd = {'lua-language-server'},
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
          path = runtime_path,
        },
        diagnostics = {
          globals = {'vim'},
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
    capabilities = capabilities
  }

  -- lspconfig.pyright.setup { capabilities = capabilities }
  -- lspconfig.emmet_ls.setup {}
  -- lspconfig.jdtls.setup {}
  --[[ lspconfig.ocamllsp.setup {
    root_dir = lspconfig.util.root_pattern(".git")
  } ]]
  -- lspconfig.hls.setup {}
  -- lspconfig.dartls.setup {}
  -- lspconfig.gopls.setup{}
  lspconfig.elixirls.setup {
    cmd = { "elixir-ls" }
  }
end
