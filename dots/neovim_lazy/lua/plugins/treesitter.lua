local function config_treesitter()
  local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

  for _, p in pairs(parser_configs) do
    p.install_info.url = p.install_info.url:gsub('github.com', _G.GITHUB)
  end

  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'lua', 'c', 'cpp', 'python', 'fish', 'clojure'
      -- 'c', 'cpp', 'rust', 'lua', 'python', 'fennel', 'query', 'fish', 
      -- 'elixir', 'clojure', 'agda', 'dart', 'racket', 'wgsl', 'ruby'
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  })
end
return { 'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  init = function()
    require('utils').lazy_load 'nvim-treesitter'
  end,
  cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
  config = config_treesitter,
}
