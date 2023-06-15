local utils = require('utils')

-- Fallback for environment variables
_G.GITHUB = vim.env["GITHUB"] or "github.com"

-- Bootstrapping

utils.ensure('wbthomason', 'packer.nvim')
-- utils.ensure('nvim-lua', 'plenary.nvim')

-- General

vim.opt.completeopt = 'menuone,noselect'
vim.opt.expandtab = true
vim.opt.tabstop = 4
-- vim.opt.guifont="FiraCode Nerd Font:h12"
vim.opt.hidden = true
vim.opt.laststatus = 2
-- vim.opt.lazyredraw = true
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
vim.opt.wrap = false
vim.opt.cmdheight = 0

vim.g.mapleader = ' '
vim.g.maplocalleader = ','
-- vim.g.did_load_filetypes = true -- Use plugin to load filetypes

-- vim.api.nvim_create_augroup('LuaAutoConfReload', {}) -- Clear old group if this config is reloaded
vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = 'init.lua',
    -- group = 'LuaAutoConfReload',
    callback = function()
        local main_config = vim.fn.resolve(vim.fn.expand('~/.config/nvim/init.lua'))
        local current_file = vim.fn.resolve(vim.fn.expand('%:p'))
        if main_config == current_file then
            vim.cmd("luafile %")
            require('packer').compile()
        end
    end
})

-- vim.api.nvim_create_augroup('Help', {})
vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'help' },
    -- group = 'Help',
    callback = function()
        vim.cmd("wincmd L")
    end

})

-- Set up packer
require('packer').startup({ function(use)

    ----- Package Manager -----

    use { 'wbthomason/packer.nvim',
        config = function()
            vim.api.nvim_set_keymap(
                'n', '<leader>pu', '<cmd>PackerSync<CR>', { noremap = true })
            vim.api.nvim_set_keymap(
                'n', '<leader>ps', '<cmd>PackerStatus<CR>', { noremap = true })
            vim.api.nvim_set_keymap(
                'n', '<leader>pc', '<cmd>PackerCompile<CR>', { noremap = true })
        end
    }

    ----- UI -----

    use {
        'brenoprata10/nvim-highlight-colors'
    }

    use 'ap/vim-css-color'

    use { 'shaunsingh/nord.nvim',
        config = function()
            require('nord').set()
        end,
    }
    --[[ use { 'nyoom-engineering/oxocarbon.nvim',
        config = function()
            vim.cmd.colorscheme "oxocarbon"
        end
    } ]]

    use { 'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        after = 'nord.nvim',
        config = function()
            require('lualine').setup({
                options = {
                    theme = 'nord',
                    refresh = {
                        statusline = 200,
                    }

                }
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
        config = function()
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
                    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "ERROR" } },
                    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
                },
            }
        end,
    }

    use { 'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup {
                char = '|',
                buftype_exclude = { 'terminal' },
                bufname_exclude = { 'OUTLINE' },
                filetype_exclude = { 'help', 'packer', 'markdown', 'man', 'result' }
            }
        end,
    }

    use {
      "folke/noice.nvim",
      disable = true,
      config = function()
        require("noice").setup({
          lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
              ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
              ["vim.lsp.util.stylize_markdown"] = true,
              ["cmp.entry.get_documentation"] = true,
            },
          },
          -- you can enable a preset for easier configuration
          presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
          },
        })
      end,
      requires = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
        }
    }


    ----- Editing -----

    use 'machakann/vim-sandwich'

    use 'wellle/targets.vim'

    use { 'windwp/nvim-autopairs',
        config = function()
            local npairs = require('nvim-autopairs')

            npairs.setup({
                disable_filetype = { 'TelescopePrompt', 'vim' },
            })

        end
    }

    use { 'phaazon/hop.nvim',
        config = function()
            require 'hop'.setup { keys = 'fhdjskalgryeuwiqot' }
            vim.api.nvim_set_keymap('n', 'f', '<cmd>HopChar2<CR>', { noremap = true })
            vim.api.nvim_set_keymap('v', 'f', '<cmd>HopChar2<CR>', { noremap = true })
            vim.api.nvim_set_keymap('o', 'f', '<cmd>HopChar2<CR>', { noremap = true })

            vim.api.nvim_set_keymap('n', 'F', '',
                { callback = function()
                    require('hop').hint_patterns({ case_insensitive = false })
                end,
                    noremap = true })
            vim.api.nvim_set_keymap('v', 'F', '',
                { callback = function()
                    require('hop').hint_patterns({ case_insensitive = false })
                end,
                    noremap = true })
            vim.api.nvim_set_keymap('o', 'F', '',
                { callback = function()
                    require('hop').hint_patterns({ case_insensitive = false })
                end,
                    noremap = true })
        end
    }

    use 'b3nj5m1n/kommentary'

    use 'tpope/vim-sleuth'

    use 'mg979/vim-visual-multi'

    use 'tpope/vim-repeat'

    ----- Tools -----

    use { 'Vonr/align.nvim',
        config = function()
            -- align_to_char(length, reverse, preview, marks)
            -- align_to_string(is_pattern, reverse, preview, marks)
            -- align(str, reverse, marks)
            -- operator(fn, opts)
            -- Where:
            --      length: integer
            --      reverse: boolean
            --      preview: boolean
            --      marks: table (e.g. {1, 0, 23, 15})
            --      str: string (can be plaintext or Lua pattern if is_pattern is true)

            local NS = { noremap = true, silent = true }

            vim.keymap.set('x', 'gaa', function() require'align'.align_to_char(1, true)             end, NS) -- Aligns to 1 character, looking left
            vim.keymap.set('x', 'gas', function() require'align'.align_to_char(2, true, true)       end, NS) -- Aligns to 2 characters, looking left and with previews
            vim.keymap.set('x', 'gaw', function() require'align'.align_to_string(false, true, true) end, NS) -- Aligns to a string, looking left and with previews
            vim.keymap.set('x', 'gar', function() require'align'.align_to_string(true, true, true)  end, NS) -- Aligns to a Lua pattern, looking left and with previews

            -- Example gawip to align a paragraph to a string, looking left and with previews
            vim.keymap.set(
                'n',
                'gaw',
                function()
                    local a = require'align'
                    a.operator(
                        a.align_to_string,
                        { is_pattern = false, reverse = true, preview = true }
                    )
                end,
                NS
            )

            -- Example gaaip to aling a paragraph to 1 character, looking left
            vim.keymap.set(
                'n',
                'gaa',
                function()
                    local a = require'align'
                    a.operator(
                        a.align_to_char,
                        { length = 1, reverse = true }
                    )
                end,
                NS
            )


        end
    }

    use { 'simrat39/symbols-outline.nvim',
        config = function()
            vim.api.nvim_set_keymap(
                'n', '<leader>o', '<cmd>SymbolsOutline<CR>', { noremap = true })
        end
    }


    use { 'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
        config = require('plugins.telescope')
    }
    use { 'nvim-telescope/telescope-frecency.nvim',
        requires = { 'tami5/sql.nvim' },
        config = function()
            require"telescope".load_extension("frecency")
        end
    }
    use { 'ahmedkhalf/project.nvim',
        config = function()
            require("project_nvim").setup {}
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
                'n', '<leader>t', '<cmd>TroubleToggle<CR>', { noremap = true })
        end
    }

    use { 'L3MON4D3/LuaSnip', event = 'InsertEnter' }

    use { 'hrsh7th/nvim-cmp',
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
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            local null_ls = require('null-ls')
            null_ls.setup {
                sources = {
                    -- general
                    null_ls.builtins.formatting.trim_newlines,
                    null_ls.builtins.formatting.trim_whitespace,
                    -- null_ls.builtins.diagnostics.clj_kondo,
                },
                on_attach = function(client)
                    if client.server_capabilities.documentFormattingProvider then
                        vim.api.nvim_create_autocmd('BufWritePre', {
                            pattern = '<buffer>',
                            callback = vim.lsp.buf.format
                        })
                    end
                end
            }
        end,
    }

    use { 'nvim-treesitter/nvim-treesitter',
        config = require('plugins.treesitter')
    }
    use { 'nvim-treesitter/playground',
        requires = 'nvim-treesitter/nvim-treesitter',
    }
    use { 'nvim-treesitter/nvim-treesitter-textobjects',
        requires = 'nvim-treesitter/nvim-treesitter',
    }

    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

    --[[ use { 'nathom/filetype.nvim',
    config = function()
      require("filetype").setup({
        overrides = {
          extensions = {
            asd = "lisp",
            ros = "lisp",
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
            -- ["Earthfile"] = "Earthfile",
            -- ["build.earth"] = "Earthfile"
          }
        },
    })
    end
  } ]]

end, config = {
    git = { default_url_format = 'https://' .. GITHUB .. '/%s' }
} })

require('mappings')
