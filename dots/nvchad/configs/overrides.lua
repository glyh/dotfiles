local M = {}

M.treesitter = {
  ensure_installed = {
    'c',
    'clojure',
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    'lua-language-server',
    'stylua',

    -- c/cpp stuff
    'clangd',
    'clang-format',

    -- clojure stuff,
    'clj-kondo',
    'clojure-lsp',
  },
  providers = { 'mason.providers.client' },
  -- registries = { 'github:mason-org/mason-registry@latest' },
  github = {
    download_url_template = 'https://hub.yzuu.cf/%s/releases/download/%s/%s',
  }
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  extension_list = { 'themes', 'terms', 'ui-select' },
}

return M
