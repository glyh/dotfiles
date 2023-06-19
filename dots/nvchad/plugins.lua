local overrides = require('custom.configs.overrides')

local lisps = { 'clojure', 'fennel', 'hy', 'racket', 'lisp', 'scheme' }

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    'neovim/nvim-lspconfig',
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

  -- override plugin configs
  {
    'williamboman/mason.nvim',
    opts = overrides.mason
  },

  {
    'nvim-treesitter/nvim-treesitter',
    opts = overrides.treesitter,
  },

  {
    'nvim-tree/nvim-tree.lua',
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    'max397574/better-escape.nvim',
    event = 'InsertEnter',
    config = function()
      require('better_escape').setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   'NvChad/nvim-colorizer.lua',
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   'mg979/vim-visual-multi',
  --   lazy = false,
  -- }

  -- Custom plugins

  -- UI
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

  -- Editing
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


  -- Lisp
  { 'eraserhd/parinfer-rust',
    ft = lisps,
    build = 'cargo build --release',
  },
  { 'guns/vim-sexp',
    enabled = false,
    ft = lisps,
    config = function()
      vim.g.sexp_filetypes = vim.fn.join(lisps, ",")
    end
  },
  { 'tpope/vim-sexp-mappings-for-regular-people',
    enabled = false,
    ft = lisps,
    dependencies = { 'guns/vim-sexp' },
  },

  -- Clojure
  -- Iced
  { 'liquidz/vim-iced',
    enabled = false,
    ft = 'clojure',
    config = function()
      vim.g.iced_enable_default_key_mappings = true
      vim.g.iced_default_key_mapping_leader = '<LocalLeader>'
    end
  },
  { 'liquidz/vim-iced-telescope-selector',
    enabled = false,
    ft = 'clojue',
    dependencies = { 'liquidz/vim-iced' },
    config = function()
      vim.g['iced#selector#search_order'] = { 'telescope' }
    end
  },
  { 'lamp/cmp-iced',
    enabled = false,
    ft = 'clojure',
    dependencies = { 'liquidz/vim-iced', 'hrsh7th/nvim-cmp' },
    config = function()
      require('cmp').config.sources({ name = 'iced' })
    end
  },

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

  { 'stevearc/overseer.nvim',
    lazy = false,
    config = function()
      require('overseer').setup({
        templates = { 'builtin' },
      })
    end
  },

  { 'nvim-telescope/telescope-ui-select.nvim' },

  { 'toppair/reach.nvim',
    config = function()
      require('reach').setup({
        notifications = true
      })
    end
  },

  { 'rcarriga/nvim-notify',
    lazy = false,
    config = function ()
      vim.notify = require('notify')
    end
  },

  { 'nvim-telescope/telescope.nvim',
    opts = {
      extensions_list = { 'themes', 'terms', 'ui-select', 'projects' }
    }
    
  },

  { 'ahmedkhalf/project.nvim',
    -- lazy = false,
    config = function()
      require("project_nvim").setup{
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "project.clj" },
      }
    end
  },
}

return plugins
