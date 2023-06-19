-- vim:foldmethod=marker
-- Locals {{{ 
local lisps = { 'clojure', 'fennel', 'hy', 'racket', 'lisp', 'scheme' }
-- }}}
return {
  -- Package Manager {{{
  { 'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        github = {
          download_url_template = 'https://' .. _G.GITHUB .. '/%s/releases/download/%s/%s',
        }
      })
    end
  },
  { 'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = 'williamboman/mason.nvim',
    lazy = false,
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = {
          -- lua
          'lua-language-server',
          'stylua',

          -- c/cpp stuff
          'clangd',
          'clang-format',

          -- clojure
          'clj-kondo',
          'clojure-lsp',
        },
        auto_update = true
      })
    end
  },
  -- }}}
  -- UI {{{
  { 'glyh/oxocarbon.nvim',
    branch = 'lualine-support',
    lazy = false,
    config = function()
      vim.opt.background = 'dark'
      vim.cmd.colorscheme('oxocarbon')
    end
  },
  { 'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('lualine').setup({
        options = {
          theme = 'oxocarbon',
          refresh = {
            statusline = 200,
          }
        }
      })
    end
  },

  { 'beauwilliams/focus.nvim',
    cmd = {
      'FocusDisable', 'FocusEnable', 'FocusToggle', 'FocusSplitNicely',
      'FocusSplitCycle', 'FocusDisableWindow', 'FocusEnableWindow',
      'FocusToggleWindow', 'FocusGetDisabledWindows', 'FocusSplitLeft',
      'FocusSplitDown', 'FocusSplitUp', 'FocusSplitRight', 'FocusEqualise',
      'FocusMaximise', 'FocusMaxOrEqual'
    },
    config = function()
      require('focus').setup({
        enable = true,
        width = math.floor(0.6 * vim.o.columns)
      })
    end,
  },

  { 'lewis6991/gitsigns.nvim',
    lazy = false,
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },

  { 'folke/todo-comments.nvim',
    lazy = false,
    config = function()
      require('todo-comments').setup {
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
    end,
  },

  { 'toppair/reach.nvim',
    config = function()
      require('reach').setup({
        notifications = true
      })
    end
  },

  { 'rcarriga/nvim-notify',
    init = function()
      vim.notify = function(...)
        vim.notify = require('notify')
        return vim.notify(...)
      end
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
  { 'b3nj5m1n/kommentary', keys = 'gc' },
  -- }}}
  -- Tools {{{
  { 'stevearc/overseer.nvim',
    lazy = false,
    config = function()
      require('overseer').setup({
        templates = { 'builtin' },
      })
    end
  },
  { 'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup{
        patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', 'project.clj', '.root' },
      }
    end
  },
  -- }}}
  -- Languages {{{
  -- Sexp
  { 'eraserhd/parinfer-rust',
    ft = lisps,
    build = 'cargo build --release',
  },
  { 'guns/vim-sexp',
    enabled = false,
    ft = lisps,
    config = function()
      vim.g.sexp_filetypes = vim.fn.join(lisps, ',')
    end
  },
  { 'tpope/vim-sexp-mappings-for-regular-people',
    enabled = false,
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
            name = 'Start Lein nREPL',
            builder = function()
              return {
                name = 'cljjack',
                cmd = { 'lein', 'update-in', ':plugins', 'conj', [=[[cider/cider-nrepl "0.24.0"]]=], '--', 'repl' },
              }
            end,
            condition = {
              filetype = { 'clojure' },
            },
        })
    end,
  },
  -- }}}
  -- Extensions {{{
  -- cmp sources
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'PaterJason/cmp-conjure' },
  { 'saadparwaiz1/cmp_luasnip' },
  -- telescope extensions
  { 'nvim-telescope/telescope-ui-select.nvim', 
    init = function()
      vim.ui.select = function(...)
        require('telescope').load_extension('ui-select')
        return vim.ui.select(...)
      end
    end
  },
  -- }}}
  --
}

