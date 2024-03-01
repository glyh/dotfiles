local M = {}

--  for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
--    config.install_info.url = config.install_info.url:gsub("https://github.com/", _G.GITHUB)
--  end

M.treesitter = {
  ensure_installed = {
    'c',
    'clojure',
    'haskell',
    'go',
    'lua',

    'ocaml',
    'ocamllex',
    'ocaml_interface',
    'menhir',

    'kotlin',

    'nim',

    -- no crystal parser available
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

    -- zig
    'zls',

    -- go 
    -- 'gopls',

    -- crystal
    'crystalline',
    'nimlangserver'
  },
  -- providers = { 'mason.providers.client' },
  -- registries = { 'github:mason-org/mason-registry@latest' },
  -- github = {
  --   download_url_template = 'https://' .. _G.GITHUB .. '/%s/releases/download/%s/%s',
  -- }
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
  extensions_list = { 'themes', 'terms', 'ui-select', 'projects' },
}

return M
