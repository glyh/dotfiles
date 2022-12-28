_G.GITHUB_CDN = (
  -- 'github.com.cnpmjs.org'
  -- 'gitclone.com/github.com'
  -- 'mirrors.tuna.tsinghua.edu.cn/git'
  -- 'hub.fastgit.org'
  -- 'hub.gitfast.tk'
  'ghproxy.com/https://github.com'
  -- 'github.com'
  )
_G.HOME_LANG = 'zh'

local utils = require('utils')

-- Bootstrapping

utils.ensure('wbthomason', 'packer.nvim')
utils.ensure('nvim-lua', 'plenary.nvim')

-- General

vim.opt.completeopt = 'menuone,noselect'
vim.opt.expandtab = true
vim.opt.guifont="FiraCode Nerd Font:h12"
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
-- vim.opt.cmdheight = 0

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
vim.g.did_load_filetypes = true -- Use plugin to load filetypes

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

  ----- Base library -----

  use 'nvim-lua/plenary.nvim'

  ----- UI -----

  use { 'itchyny/lightline.vim',
    config = function()
      vim.g.lightline = { colorscheme = 'nord' }
    end
  }

  use { 'shaunsingh/nord.nvim',
    config = function()
      vim.cmd([[
         colorscheme nord
         syntax enable
      ]])
    end,
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
      --[[ require('utils').augroup('autopairs-custom',
        {{'FileType', LISP_FILE_TYPES, function()
          npairs.remove_rule('`')
          npairs.remove_rule("'")
      end}}) ]]
      npairs.remove_rule('`')
      npairs.remove_rule("'")
      -- FIXME:
      npairs.add_rules({
        Rule("`", "`", {"-lisp", "-clojure"})
      })
      npairs.add_rules({
        Rule("'", "'", {"-lisp", "-clojure"})
      })
    end
  }

  use { 'phaazon/hop.nvim',
    config = function()
      require'hop'.setup { keys = 'fhdjskalgryeuwiqot' }
      vim.api.nvim_set_keymap('n', 'f', '<cmd>HopChar2<CR>', {noremap = true})
      vim.api.nvim_set_keymap('v', 'f', '<cmd>HopChar2<CR>', {noremap = true})
      vim.api.nvim_set_keymap('o', 'f', '<cmd>HopChar2<CR>', {noremap = true})
      vim.api.nvim_set_keymap('n', 'F',
        "<cmd>lua require('hop').hint_patterns({case_insensitive = false})<CR>",
        {noremap = true})
      vim.api.nvim_set_keymap('v', 'F',
        "<cmd>lua require('hop').hint_patterns({case_insensitive = false})<CR>",
        {noremap = true})
      vim.api.nvim_set_keymap('o', 'F',
        "<cmd>lua require('hop').hint_patterns({case_insensitive = false})<CR>",
        {noremap = true})
    end
  }

  use 'b3nj5m1n/kommentary'

  use 'tpope/vim-sleuth'

  use 'mg979/vim-visual-multi'

  use 'kana/vim-arpeggio'

  use 'tpope/vim-repeat'

  ----- Tools -----

  use { 'junegunn/vim-easy-align',
    config = function ()
      vim.cmd([[
        " Start interactive EasyAlign in visual mode (e.g. vipga)
        xmap ga <Plug>(EasyAlign)

        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)
      ]])
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
            ["CMakeCommon.txt"] = "cmake",
            ["Earthfile"] = "Earthfile",
            ["build.earth"] = "Earthfile"
          }
        },
    })
    end
  }

  -- use { 'lilydjwg/fcitx.vim' }
  use {'ojroques/vim-oscyank',
    branch = 'main',
    config = function()
        vim.api.nvim_set_keymap(
          'v', '<leader>y', '<cmd>OSCYank<CR>', {noremap = true})
        vim.api.nvim_set_keymap(
          'n', '<leader>y', '<Plug>OSCYank', {})
    end
  }

end,config = {
  git = { default_url_format = 'https://' .. _G.GITHUB_CDN .. '/%s' }
}})

require('mappings')

-- fixes

--[[ vim.api.nvim_create_autocmd({"VimEnter"}, {
  callback = function()
    local pid, WINCH = vim.fn.getpid(), vim.loop.constants.SIGWINCH
    vim.defer_fn(function() vim.loop.kill(pid, WINCH) end, 20)
  end
}) ]]
