local utils = require('utils')

-- Fallback for environment variables
_G.GITHUB = vim.env["GITHUB"] or "www.github.com"

-- Bootstrapping

utils.ensure('wbthomason', 'packer.nvim')
-- utils.ensure('nvim-lua', 'plenary.nvim')

-- General

_G.LISP_FILE_TYPES = {'clojure', 'fennel', 'hy', 'racket', 'lisp', 'scheme'}

vim.opt.completeopt = 'menuone,noselect'
vim.opt.expandtab = true
-- vim.opt.guifont="FiraCode Nerd Font:h12"
vim.opt.hidden = true
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.list = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.sessionoptions = 'blank,curdir,folds,help,tabpages,winsize'
vim.opt.shiftwidth = 4
vim.opt.splitbelow = false
vim.opt.splitright = true
vim.opt.updatetime = 500
vim.opt.wrap = true
vim.opt.cmdheight = 0

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.did_load_filetypes = true -- Use plugin to load filetypes

vim.api.nvim_create_augroup('LuaAutoConfReload', {}) -- Clear old group if this config is reloaded
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = 'init.lua',
  group = 'LuaAutoConfReload',
  callback = function()
    local main_config = vim.fn.resolve(vim.fn.expand('~/.config/nvim/init.lua'))
    local current_file = vim.fn.resolve(vim.fn.expand('%:p'))
    if main_config == current_file then
      vim.cmd("luafile %")
      require('packer').compile()
    end
  end
})

-- Set up packer
require('packer').startup({function(use)

  ----- Package Manager -----

  use { 'wbthomason/packer.nvim',
    config = function()
        vim.api.nvim_set_keymap(
          'n', '<leader>pu', '<cmd>PackerSync<CR>', {noremap = true})
        vim.api.nvim_set_keymap(
          'n', '<leader>ps', '<cmd>PackerStatus<CR>', {noremap = true})
        vim.api.nvim_set_keymap(
          'n', '<leader>pc', '<cmd>PackerCompile<CR>', {noremap = true})
    end
  }

  use { 'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        github = {
          download_url_template = "https://" .. GITHUB .. "/%s/releases/download/%s/%s",
        }
      })
    end
  }

  use { 'WhoIsSethDaniel/mason-tool-installer.nvim',
    requires = 'williamboman/mason.nvim',
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = {
          -- LSPs
          'lua-language-server',
          'pyright',
        },
        auto_update = true
      })
    end
  }

  ----- Base library -----

  use 'nvim-lua/plenary.nvim'

  ----- FileType Support -----

  use { 'tylerw/zinit-vim-syntax', ft = 'zsh'}
  -- use { 'justinmk/vim-syntax-extra'}
  -- use { 'earthly/earthly.vim' }
  -- use { 'Glench/Vim-Jinja2-Syntax', ft = 'j2' }
  use { 'clones/vim-zsh', ft = 'zsh'}
  -- use {'zah/nim.vim', ft = 'nim' }
  -- use { 'bakpakin/fennel.vim', ft = 'fennel' } -- Have treesitter syntax, can disable
  use { 'ajouellette/sway-vim-syntax', ft = 'sway' }
  use {'janet-lang/janet.vim', ft = 'janet'}
  use { 'wlangstroth/vim-racket', ft = 'racket' }
  use {'hylang/vim-hy', ft = 'hy'}
  use {'kmonad/kmonad-vim', ft = 'kbd'}
  use {'ziglang/zig.vim', ft = 'zig'}

  --[=[ use { 'vlime/vlime', ft = 'lisp',
    disable = true,
    config = function()
      vim.g.vlime_cl_impl = "ros"
      vim.cmd([[
        function! VlimeBuildServerCommandFor_ros(vlime_loader, vlime_eval)
            return ["ros", "run",
                        \ "--load", a:vlime_loader,
                        \ "--eval", a:vlime_eval]
        endfunction
      ]])
    end
  } ]=]

  use { 'nvim-neorg/neorg',
    after = 'nvim-treesitter',
    config = function()
      require('neorg').setup({
         load = {
           ["core.defaults"] = {}, -- Load all the default modules
           ["core.norg.concealer"] = {}, -- Allows for use of icons
           ["core.norg.dirman"] = { -- Manage your directories with Neorg
             config = {
               workspaces = {
                 my_workspace = "~/Documents/Neorg"
               }
             }
           },
        }
      })
    end,
    requires = 'nvim-lua/plenary.nvim'
  }

  use { 'lervag/vimtex',
    ft = 'tex',
    config = function()
      vim.g.vimtex_view_enabled = true
      vim.g.vimtex_view_method = 'zathura'
    end
  }

  ----- UI -----

  use { 'shaunsingh/nord.nvim',
    config = function()
      require('nord').set()
    end,
  }

  use { 'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    after = 'nord.nvim',
    config = function()
      require('lualine').setup({
        options = { theme = 'nord' }
      })
    end
  }

  use { 'beauwilliams/focus.nvim',
    config = function()
      require('focus').setup({
        enable = true,
        width = math.floor(0.6 * vim.o.columns)
      })
    end,
  }

  use { 'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  }

  use { 'folke/todo-comments.nvim',
    config = function ()
      require('todo-comments').setup {
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
            -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "info" },
          OK = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" , "ERROR"} },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        },
      }
    end,
  }

  use { 'lukas-reineke/indent-blankline.nvim',
    config = function ()
      require('indent_blankline').setup {
        char = '|',
        buftype_exclude = {'terminal'},
        bufname_exclude = {'OUTLINE'},
        filetype_exclude = {'help', 'packer', 'markdown', 'man', 'result'}
      }
    end,
  }

  ----- Editing -----

  use 'machakann/vim-sandwich'

  use 'wellle/targets.vim'

  use { 'windwp/nvim-autopairs',
    config = function()
      local npairs = require('nvim-autopairs')
      local Rule = require('nvim-autopairs.rule')
      npairs.setup({
        disable_filetype = { 'TelescopePrompt' , 'vim' },
      })

      local exclude_lisps = vim.tbl_map(function(ft) return '-' .. ft end, LISP_FILE_TYPES)
      local exclude_patterns = {"'", '`'}
      for _, pattern in ipairs(exclude_patterns) do
        npairs.remove_rule(pattern)
        npairs.add_rule(Rule(pattern, pattern, exclude_lisps))
      end
    end
  }

  use { 'phaazon/hop.nvim',
    config = function()
      require'hop'.setup { keys = 'fhdjskalgryeuwiqot' }
      vim.api.nvim_set_keymap('n', 'f', '<cmd>HopChar2<CR>', {noremap = true})
      vim.api.nvim_set_keymap('v', 'f', '<cmd>HopChar2<CR>', {noremap = true})
      vim.api.nvim_set_keymap('o', 'f', '<cmd>HopChar2<CR>', {noremap = true})

      vim.api.nvim_set_keymap('n', 'F', '',
        {callback = function()
          require('hop').hint_patterns({case_insensitive = false})
         end,
         noremap = true})
      vim.api.nvim_set_keymap('v', 'F', '',
        {callback = function()
          require('hop').hint_patterns({case_insensitive = false})
         end,
         noremap = true})
      vim.api.nvim_set_keymap('o', 'F', '',
        {callback = function()
          require('hop').hint_patterns({case_insensitive = false})
         end,
         noremap = true})
    end
  }

  use { 'eraserhd/parinfer-rust',
    ft = LISP_FILE_TYPES,
    run = 'cargo build --release',
  }
  use { 'guns/vim-sexp',
    ft = LISP_FILE_TYPES,
    config = function()
      vim.g.sexp_filetypes = LISP_FILE_TYPES
    end
  }
  use { 'tpope/vim-sexp-mappings-for-regular-people',
    ft = LISP_FILE_TYPES,
    requires = 'guns/vim-sexp',
  }

  use 'b3nj5m1n/kommentary'

  use 'tpope/vim-sleuth'

  use 'mg979/vim-visual-multi'

  use 'tpope/vim-repeat'

  ----- Tools -----

  use { 'junegunn/vim-easy-align',
    config = function ()
      vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", {})
      vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", {})
      --[==[
      vim.cmd([[
        " Start interactive EasyAlign in visual mode (e.g. vipga)
        xmap ga <Plug>(EasyAlign)

        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign) ]])
      --]==]
    end
  }

  use { 'kevinhwang91/rnvimr',
    disable = true,
    config = function ()
      vim.g.rnvimr_enable_ex = 1
      vim.g.rnvimr_enable_picker = 1
      vim.api.nvim_set_keymap(
        'n', '<A-o>', '<cmd>RnvimrToggle<CR>', {noremap = true})
    end
  }

  use { 'simrat39/symbols-outline.nvim',
    -- disable = true,
    config = function()
      vim.api.nvim_set_keymap(
        'n', '<leader>o', '<cmd>SymbolsOutline<CR>', {noremap = true})
    end
  }


  use { 'glyh/conjure',
    branch = "develop",
    config = function()
      vim.g['conjure#log#hud#border'] = 'none'
      vim.g['conjure#extract#tree_sitter#enabled'] = true
      vim.g['conjure#mapping#eval_visual'] = 'e'

      vim.g['conjure#client#scheme#stdio#command'] = 'chez'
      vim.g['conjure#client#scheme#stdio#prompt_pattern'] = '> $'
      vim.g['conjure#client#scheme#stdio#value_prefix_pattern'] = false

      -- vim.g['conjure#client#lua#neovim#persistent'] = "none"
      -- vim.g['conjure#filetype#lisp'] = 'conjure.client.common-lisp.nrepl'
      -- vim.g['conjure#client#fennel#aniseed#aniseed_module_prefix'] = 'aniseed.'
    end,
    -- requires = 'Olical/aniseed'
  }

  use { 'mfussenegger/nvim-dap',
    config = require('plugins.dap'),
  }
  use { 'rcarriga/nvim-dap-ui',
    requires = 'mfussenegger/nvim-dap',
    config = require('plugins.dapui')
  }
  use 'jbyuki/one-small-step-for-vimkind'

  use { 'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
    config = require('plugins.telescope')
  }
  use { 'nvim-telescope/telescope-frecency.nvim',
    requires = {'tami5/sql.nvim', 'nvim-telescope/telescope.nvim'}
  }
  use {'nvim-telescope/telescope-fzf-native.nvim',
    requires = 'nvim-telescope/telescope.nvim',
    run = 'make'
  }
  use { 'nvim-telescope/telescope-dap.nvim',
    requires = 'nvim-telescope/telescope.nvim',
  }
  use {'ahmedkhalf/project.nvim',
    config = function()
      require("project_nvim").setup{}
    end
  }

  use { 'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
      vim.api.nvim_set_keymap(
        'n', '<leader>t', '<cmd>TroubleToggle<CR>', {noremap = true})
    end
  }

  use { 'L3MON4D3/LuaSnip', event = 'InsertEnter' }

  use { 'hrsh7th/nvim-cmp',
    after = 'neorg', -- LuaSnip dispatches in runtime
    event = {'InsertEnter', 'CmdlineEnter'},
    config = require('plugins.cmp'),
  }
  use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
  use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }
  use { 'saadparwaiz1/cmp_luasnip', after = "nvim-cmp" }
  use { 'hrsh7th/cmp-nvim-lsp', after = "nvim-cmp" }
  use { 'PaterJason/cmp-conjure', after = {"nvim-cmp", "conjure"} }

  use { 'neovim/nvim-lspconfig', config = require('plugins.lspconfig') }

  use { 'jose-elias-alvarez/null-ls.nvim',
    disable = true,
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      local null_ls = require('null-ls')
      null_ls.setup {
        sources = {
          -- general
          null_ls.builtins.formatting.trim_newlines,
          null_ls.builtins.formatting.trim_whitespace
        },
        on_attach = function(client)
          if client.resolved_capabilities.document_formatting then
            vim.api.nvim_create_autocmd('BufWritePre', {
              pattern = '<buffer>',
              callback = vim.lsp.buf.formatting
            })
            -- vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()')
          end
        end
      }
    end,
  }

  use { 'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = require('plugins.treesitter')
  }
  use { 'nvim-treesitter/playground',
    -- requires = 'nvim-treesitter/nvim-treesitter',
    -- config = require('plugins.treesitter')
  }
  use { 'nvim-treesitter/nvim-treesitter-textobjects',
    -- requires = 'nvim-treesitter/nvim-treesitter',
    -- config = require('plugins.treesitter')
  }

  use { 'mbbill/undotree',
    disable = true,
    config = function()
      vim.api.nvim_set_keymap(
        'n', '<leader>u', '<cmd>UndotreeToggle<CR>', {noremap = true})
    end
  }

  use { 'voldikss/vim-translator',
    config = function()
      -- g.translator_window_type = 'preview'
      vim.g.translator_target_lang = 'zh'
      vim.g.translator_default_engines = {'bing'}
      vim.api.nvim_set_keymap("n", "t", "<Plug>TranslateW", {})
      vim.api.nvim_set_keymap("v", "t", "<Plug>TranslateWV", {})
    end
  }

  -- use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  use { 'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        bypass_session_save_file_types = {}
      }
    end,
    disable = true
  }

  use { 'nathom/filetype.nvim',
    config = function()
      require("filetype").setup({
        overrides = {
          extensions = {
            -- asd = "lisp",
            -- ros = "lisp",
            -- jimple = "java",
            -- jimp = "java",
            fnl = "fennel",
            luajit = "lua",
            -- NOTE: This a workaround on vim-racket
            -- rkt = "racket",
          },
          shebang = {
            bb = "clojure",
          },
          literal = {
            -- ["CMakeCommon.txt"] = "cmake",
            -- ["Earthfile"] = "Earthfile",
            -- ["build.earth"] = "Earthfile"
          }
        },
    })
    end
  }

  -- use {
  --   'tonyfettes/fcitx5.nvim',
  --   tag = 'v0.0.1-alpha',
  --   rocks = {'dbus_proxy', 'lgi'},
  --   config = function()
  --     vim.api.nvim_set_keymap('i', '<M-Tab>', '',
  --       {callback = function()
  --         require('fcitx5').toggle()
  --        end,
  --        noremap = true})
  --   end
  -- }

end,config = {
  git = { default_url_format = 'https://' .. GITHUB .. '/%s' }
}})

require('mappings')
