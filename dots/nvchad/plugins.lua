-- vim:foldmethod=marker

local overrides = require('custom.configs.overrides')

local lisps = { 'clojure', 'fennel', 'hy', 'racket', 'lisp', 'scheme', 'janet', 'dune' }

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
    dependencies = {
      'nvim-treesitter/playground'
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. 'syntax')
      for _, config in pairs(require('nvim-treesitter.parsers').get_parser_configs()) do
        config.install_info.url = config.install_info.url:gsub('github.com', _G.GITHUB)
      end
      opts.playground = { enabled = true }
      require('nvim-treesitter.configs').setup(opts)
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

  { 'hrsh7th/nvim-cmp',
    config = function(_, opts)
      opts.sources[#opts.sources + 1] = { name = 'conjure' }
      require("cmp").setup(opts)
    end
  },

  { 'machakann/vim-sandwich',
    keys = {
      { 'sa', mode = { 'n', 'v' } },
      { 'sd', mode = { 'n', 'v' } },
      { 'sr', mode = { 'n', 'v' } },
    }
  },
  { 'wellle/targets.vim',
    keys = {
      { 'a', mode = { 'x', 'o' } },
      { 'i', mode = { 'x', 'o' } },
    },
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

  { 'mfussenegger/nvim-dap',
    config = function() require 'custom.configs.dap' end,
  },

  { 'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = "TroubleToggle",
  },

  { 'stevearc/overseer.nvim',
    config = function()
      require('overseer').setup({
        templates = { 'builtin' },
      })
    end
  },

  { 'toppair/reach.nvim',
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
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "project.clj", "build.zig" },
      }
    end
  },

  { 'nvim-neorg/neorg',
    enabled = false,
    lazy = false,
    -- cmd = "Neorg",
    ft = 'norg',
    build = ':Neorg sync-parsers',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Documents/notes",
              },
            },
          },
        },
      }
    end
  },

  -- }}}

  -- Lisp {{{

  -- { 'eraserhd/parinfer-rust',
  --  ft = lisps,
  --  build = 'cargo build --release',
  -- },
  { 'julienvincent/nvim-paredit',
    ft = lisps,
    config = function()
      require("nvim-paredit").setup()
    end
  },

  -- Clojure & Conjure {{{
  { 'Olical/conjure',
    -- ft = lisps,
    lazy = false,
    -- enabled = false,
    config = function()
        vim.g['conjure#log#hud#border'] = 'none'
        vim.g['conjure#extract#tree_sitter#enabled'] = true
        vim.g['conjure#mapping#eval_visual'] = 'e'
        vim.g['conjure#mapping#doc_word'] = false

        -- For lein
        require('overseer').register_template({
            name = "Start Lein nREPL",
            builder = function()
              return {
                name = 'clj-lein-jack',
                cmd = { "lein", "update-in", ":plugins", "conj", '[cider/cider-nrepl "0.24.0"]', '--', 'repl' },
              }
            end,
            condition = {
              filetype = { "clojure" },
            },
        })

        -- For shadow-cljs
      --   vim.cmd [[
      --   function! AutoConjureSelect()
      --   let shadow_build=system("ps aux | grep 'shadow-cljs watch' | head -1 | sed -E 's/.*?shadow-cljs watch //' | tr -d '\n'")
      --   let cmd='ConjureShadowSelect ' . shadow_build
      --   execute cmd
      -- endfunction
      -- command! AutoConjureSelect call AutoConjureSelect()
      -- autocmd BufReadPost *.cljs :AutoConjureSelect
      --
      --   ]]

        require('which-key').register({
          ['k'] = { require('conjure.eval')["doc-word"], 'Get document under cursor'}
        }, { prefix = '<localleader>' })

    end,
  },
  { 'PaterJason/cmp-conjure',
    -- enabled = false,
    dependencies = {'nvim-cmp', 'conjure'} },
  -- }}}

  -- Clojure & Iced {{{
  { 'liquidz/vim-iced',
    ft = 'clojure',
    enabled = false,
    config = function(plugin, _)

      vim.g['iced_enable_default_key_mappings'] = true

      require('overseer').register_template({
          name = 'Start Iced nREPL',
          builder = function()
            return {
              name = 'iced-jack',
              cmd = { plugin.dir .. '/bin/iced', 'repl' },
            }
          end,
          condition = {
            filetype = { 'clojure' },
          },
      })
    end
  },
  { 'lamp/cmp-iced',
    ft = 'clojure',
    enabled = false
  },
  -- }}}

  -- }}}

  -- Markdown {{{
  { 'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      require('which-key').register({
        ['p'] = { '<cmd>MarkdownPreviewToggle<CR>', 'Toggle markdown preview'}
      }, { prefix = '<localleader>' })
      vim.g.mkdp_browser = 'qutebrowser'
      vim.g.mkdp_theme = 'dark'
    end,
    ft = 'markdown'
  },

  -- }}}

  -- Fuck go: parser generator hard to use
  -- Go {{
  -- { 'fatih/vim-go', ft = 'go' },
  -- }}

  -- Fuck Crystal: shitty ADT support
  -- Crystal {{
  { 'jlcrochet/vim-crystal', ft = 'crystal' },
  -- }}

  -- Racket {{
  { 'wlangstroth/vim-racket', lazy = false },
  -- }}

  -- Oil {{
  -- { 'glyh/vim-oil', lazy = false },
  -- }}

  -- { 'Raku/vim-raku', ft = 'raku' },


-- WARN: Turn this on to have error with plugins that requires ftplugin
-- Filetype {{
  { 'nathom/filetype.nvim',
    enabled = false,
    lazy = false,
    config = function()
      require("filetype").setup({
          overrides = {
              extensions = {
                  -- Set the filetype of *.pn files to potion
                  mll = "ocamllex",
                  mly = "menhir",
              },

              complex = {
                  -- Set the filetype of any full filename matching the regex to gitconfig
                  [".*git/config"] = "gitconfig", -- Included in the plugin
              },

              literal = {
                dune = "dune",
                ["dune-project"] = "dune",
              },

              shebang = {
                raku = "raku",
              },
          },
      })
    end
  },
-- }}

-- {{ Idris
  -- { 'edwinb/idris2-vim', lazy = false },

  -- drag my start up time low, shift
  -- { 'ShinKage/idris2-nvim',
  --   dependencies = {'neovim/nvim-lspconfig', 'MunifTanjim/nui.nvim'},
  --   -- ft = 'idr',
  --   lazy = false,
  --   config = function()
  --     require('idris2').setup({})
  --     vim.cmd [[highlight link LspSemantic_type Include]]
  --   end
  -- },
-- }}

-- {{ Janet
  { 'janet-lang/janet.vim', ft='janet' },

-- }}

-- Coq {{{
  {'whonore/Coqtail', ft='coq',
    config=function()
      -- local enable_providers = {
      --   "python3_provider",
      --   -- "node_provider",
      --   -- and so on
      -- }

      vim.g['loaded_python3_provider'] = nil
      vim.cmd('runtime python3_provider')
      -- for _, plugin in pairs(enable_providers) do
      --   vim.g["loaded_" .. plugin] = nil
      --   vim.cmd("runtime " .. plugin)
      -- end

    end},
  -- }}}

  -- Extensions {{{
  { 'PaterJason/cmp-conjure' },
  { 'nvim-telescope/telescope-ui-select.nvim',
    init = function()
      vim.ui.select = function(...)
        require('telescope').load_extension('ui-select')
        return vim.ui.select(...)
      end
    end
  },
  -- }}}

  -- Typst {{{
  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy=false,
  },
  -- }}}

  { 'lervag/vimtex', ft='tex', config = function()
    vim.g.vimtex_view_method = 'zathura'
  end},
}

return plugins
