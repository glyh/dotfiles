-- this template is borrowed from nvim-lspconfig
local on_windows = vim.loop.os_uname().version:match("Windows")

_G.GITHUB_CDN = 'ghproxy.com/https://github.com'

local function join_paths(...)
    local path_sep = on_windows and "\\" or "/"
    local result = table.concat({ ... }, path_sep)
    return result
end

vim.cmd([[set runtimepath=$VIMRUNTIME]])

local temp_dir
if on_windows then
    temp_dir = vim.loop.os_getenv("TEMP")
else
    temp_dir = "/tmp"
end

vim.cmd("set packpath=" .. join_paths(temp_dir, "nvim", "site"))

local package_root = join_paths(temp_dir, "nvim", "site", "pack")
local install_path = join_paths(package_root, "packer", "start", "packer.nvim")
local compile_path = join_paths(install_path, "plugin", "packer_compiled.lua")

local function load_plugins()
    -- only add other plugins if they are necessary to reproduce the issue
    require("packer").startup({
        {
            "wbthomason/packer.nvim",
            { 'nvim-treesitter/nvim-treesitter',
              config = function()
  local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()


  for _, p in pairs(require('nvim-treesitter.parsers').get_parser_configs()) do
    p.install_info.url = p.install_info.url:gsub('github.com', _G.GITHUB_CDN)
  end

  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'c', 'cpp', 'rust', 'lua', 'python', 
      'fennel', 'query', 'fish', 'elixir'
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<localleader>v',
        node_incremental = 'go',
        node_decremental = 'gi',
      }
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25,
      persist_queries = false,
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'i',
        focus_language = 'f',
        unfocus_language = 'f',
        update = 'r',
        goto_node = '<CR>',
        show_help = '?',
      }
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        }
      },
    },
  })
              end
            }

        },
        config = {
            package_root = package_root,
            compile_path = compile_path,
            git = { default_url_format = 'https://' .. _G.GITHUB_CDN .. '/%s' }
        },
    })
end

if vim.fn.isdirectory(install_path) == 0 then
    vim.fn.system({ "git", "clone", 'https://' .. _G.GITHUB_CDN .. '/wbthomason/packer.nvim', install_path })
end
load_plugins()
-- require("packer").sync()

vim.cmd([[ set completeopt=menu,menuone,noselect]])
