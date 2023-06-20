-- vim:foldmethod=marker

local overrides = require('custom.configs.overrides')

local lisps = { 'clojure', 'fennel', 'hy', 'racket', 'lisp', 'scheme' }

---@type NvPluginSpec[]
local plugins = {

  -- Builtin plugins {{{

  { 'neovim/nvim-lspconfig',
    dependencies = {
      -- format & linting
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          require 'custom.configs.null-ls'
        end,
      },
    },
    config = function()
      require 'plugins.configs.lspconfig'
      require 'custom.configs.lspconfig'
    end, -- Override to setup mason-lspconfig
  },

  { 'nvim-treesitter/nvim-treesitter',
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "syntax")
      for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
        config.install_info.url = config.install_info.url:gsub("github.com", _G.GITHUB)
      end
      require("nvim-treesitter.configs").setup(opts)
    end
  },

  -- override plugin configs
  { 'williamboman/mason.nvim', opts = overrides.mason },

  { 'nvim-treesitter/nvim-treesitter', opts = overrides.treesitter, },

  { 'nvim-tree/nvim-tree.lua', opts = overrides.nvimtree, },

  { 'nvim-telescope/telescope.nvim', opts = overrides.telescope },

  -- }}}

  -- UI {{{
  { "folke/which-key.nvim",
    -- lazy = false,
    keys = { "<leader>", '"', "'", "`", "c", "v", ";" },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      require("which-key").setup(opts)
      require 'custom.configs.whichkey'
    end,
  },

  { 'folke/todo-comments.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      lazy = false,
      opts = {
        keywords = {
            FIX = {
                icon = ' ', -- icon used for the sign, and in search results
                color = 'error', -- can be a hex color, or a named color (see below)
                alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
                -- signs = false, -- configure signs for some keywords individually
            },
            TODO = { icon = ' ', color = 'info' },
            OK = { icon = ' ', color = 'info' },
            HACK = { icon = ' ', color = 'warning' },
            WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX', 'ERROR' } },
            PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
            NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
        },

      }
  },

  { 'rcarriga/nvim-notify',
    init = function()
      vim.notify = function(...)
        vim.notify = require('notify')
        return vim.notify(...)
      end
    end,
    config = function ()
      vim.notify = require('notify')
    end
  },

  -- }}}

  -- Editing {{{

  { 'machakann/vim-sandwich',
    keys = {
      { 'sa', mode = { 'n', 'v' } },
      { 'sd', mode = { 'n', 'v' } },
      { 'sr', mode = { 'n', 'v' } },
    }
  },
  { 'echasnovski/mini.ai',
    keys = {
      { 'a', mode = { 'x', 'o' } },
      { 'i', mode = { 'x', 'o' } },
    },
    config = function()
      require('mini.ai').setup {}
    end,
  },
  { 'phaazon/hop.nvim',
    keys = {
      { 'f', '<cmd>HopChar2<CR>', noremap = true, mode = {'n', 'v', 'o'} },
      { 'F', function()
        require('hop').hint_patterns({ case_insensitive = false })
      end, noremap = true, mode = {'n', 'v', 'o'} },
    },
    config = function()
      require('hop').setup { keys = 'fhdjskalgryeuwiqot' }
    end
  },
  { 'tpope/vim-sleuth', lazy = false },
  { 'tpope/vim-repeat', keys = '.' },
  -- }}}

  -- Tools {{{

  { 'stevearc/overseer.nvim',
    config = function()
      require('overseer').setup({
        templates = { 'builtin' },
      })
    end
  },

  { 'toppair/reach.nvim',
    lazy = false,
    dependencies = 'nvim-web-devicons',
    config = function()
      require('reach').setup({
        notifications = true
      })
    end
  },
  { 'ahmedkhalf/project.nvim',
    -- BUG: project.nvim doesn't run well if we lazy load it
    lazy = false,
    config = function()
      require("project_nvim").setup{
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "project.clj" },
      }
    end
  },

  -- }}}

  -- Lisp {{{

  { 'eraserhd/parinfer-rust',
    ft = lisps,
    build = 'cargo build --release',
  },
  { 'guns/vim-sexp',
    ft = lisps,
    config = function()
      vim.g.sexp_filetypes = vim.fn.join(lisps, ",")
    end
  },
  { 'tpope/vim-sexp-mappings-for-regular-people',
    ft = lisps,
    dependencies = { 'guns/vim-sexp' },
  },

  -- Clojure
  { 'Olical/conjure',
    ft = 'clojure',
    config = function()
        vim.g['conjure#log#hud#border'] = 'none'
        vim.g['conjure#extract#tree_sitter#enabled'] = true
        vim.g['conjure#mapping#eval_visual'] = 'e'
        vim.g['conjure#mapping#doc_word'] = false

        vim.g['conjure#client#scheme#stdio#command'] = 'chez'
        vim.g['conjure#client#scheme#stdio#prompt_pattern'] = '> $'
        vim.g['conjure#client#scheme#stdio#value_prefix_pattern'] = false

        require('overseer').register_template({
            name = "Start Lein nREPL",
            builder = function()
              return {
                name = 'cljjack',
                cmd = { "lein", "update-in", ":plugins", "conj", '[cider/cider-nrepl "0.24.0"]', '--', 'repl' },
              }
            end,
            condition = {
              filetype = { "clojure" },
            },
        })
    end,
  },
  { 'PaterJason/cmp-conjure', dependencies = {'nvim-cmp', 'conjure'} },
  { 'hrsh7th/nvim-cmp',
    config = function(_, opts)
      opts.sources[#opts.sources + 1] = { name = 'conjure' }
      require("cmp").setup(opts)
    end
  },

  -- }}}

  -- Extensions {{{
  { 'PaterJason/cmp-conjure' },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  -- }}}
}

return plugins
