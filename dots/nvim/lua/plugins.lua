-- vim:foldmethod=marker

-- Plugin to install: dial.nvim

local pdf_viewer = "zathura"
local lispy_filetypes = { "clojure", "dune", "scheme", "fennel" }
---@type NvPluginSpec[]
return {
  -- IDE {{{
  {
    "hrsh7th/nvim-cmp",
    config = function(_, opts)
      opts.sources[#opts.sources + 1] = { name = "conjure" }
      local cmp = require "cmp"
      cmp.setup(opts)
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- cmp.setup.cmdline(":", {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = cmp.config.sources({
      --     { name = "path" },
      --   }, {
      --     { name = "cmdline" },
      --   }),
      -- })
    end,
    dependencies = {
      "hrsh7th/cmp-cmdline",
      { "PaterJason/cmp-conjure", dependencies = "Olical/conjure" },
    },
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
  },

  {
    "whoissethdaniel/mason-tool-installer.nvim",
    lazy = false,
    config = function()
      require("mason-tool-installer").setup {
        -- a list of all tools you want to ensure are installed upon
        -- start
        ensure_installed = {
          -- Kotlin {{{
          -- "kotlin-language-server",
          -- }}}
          -- Lua {{{
          "lua-language-server",
          "stylua",
          -- }}}
          -- C/Cpp {{{
          "clangd",
          "clang-format",
          "cmake-language-server",
          -- }}}
          -- Clojure {{{
          -- 'clj-kondo',
          -- 'clojure-lsp',
          -- }}}
          -- Zig {{{
          -- "zls", // let zvm manage zls
          -- }}}
          -- Go {{{
          "gopls",
          -- }}}
          -- Typst {{{
          "typst-lsp",
          -- }}}
          -- Python {{{
          "pyright",
          -- }}}
          -- Ocaml {{{
          -- "ocaml-lsp", -- let opam handle this
          -- }}}
          -- ruby {{{
          -- "ruby-lsp",
          -- "sorbet",
          -- }}}
          -- Shaders {{{
          -- "wgsl-analyzer", -- too old, broken
          "glsl_analyzer",
          -- }}}
          -- Elixir {{{
          "elixir-ls",
          -- }}}
          -- Js {{{
          "eslint-lsp",
          -- }}}
        },

        auto_update = false,
        run_on_start = true,
        start_delay = 3000,
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "configs.treesitter"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeFocus", "NvimTreeClose" },
  },
  {
    "kelly-lin/ranger.nvim",
    lazy = false,
    config = function()
      local ranger_nvim = require "ranger-nvim"
      ranger_nvim.setup {
        enable_cmds = false,
        replace_netrw = true,
        keybinds = {
          ["ov"] = ranger_nvim.OPEN_MODE.vsplit,
          ["oh"] = ranger_nvim.OPEN_MODE.split,
          ["ot"] = ranger_nvim.OPEN_MODE.tabedit,
          ["or"] = ranger_nvim.OPEN_MODE.rifle,
        },
        ui = {
          border = "none",
          height = 1,
          width = 1,
          x = 0.5,
          y = 0.5,
        },
      }
      vim.api.nvim_set_keymap("n", "<leader>ef", "", {
        noremap = true,
        callback = function()
          require("ranger-nvim").open(true)
        end,
      })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require "configs.dap"
    end,
  },

  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup {
        templates = { "builtin" },
      }
    end,
  },

  {
    "glyh/project.nvim",
    -- BUG: project.nvim doesn't run well if we lazy load it
    -- enabled = false,
    lazy = false,
    config = function()
      require("project_nvim").setup {
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "project.clj", "build.zig" },
      }
    end,
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      -- Your setup opts here
    },
  },
  -- }}}
  -- UI {{{
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    config = true,
  },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<localleader>", '"', "'", "`", "c", "v", ";" },
    config = function()
      require "configs.whichkey"
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    opts = {
      keywords = {
        FIX = {
          icon = " ", -- icon used for the sign, and in search results
          color = "error", -- can be a hex color, or a named color (see below)
          alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          -- signs = false, -- configure signs for some keywords individually
        },
        REF = { icon = "", color = "info" },
        TODO = { icon = " ", color = "info" },
        OK = { icon = "󰩐 ", color = "info" },
        HACK = { icon = "󰠥 ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "ERROR" } },
        PERF = { icon = "󱎫 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = "󰹕 ", color = "hint", alt = { "INFO" } },
      },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "TroubleToggle",
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
    lazy = false,
  },
  {
    "toppair/reach.nvim",
    dependencies = "nvim-web-devicons",
    config = function()
      require("reach").setup {
        notifications = true,
      }
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require "configs.telescope"
    end,
  },
  -- }}}
  -- Editing {{{
  {
    "keaising/im-select.nvim",
    event = "InsertEnter",
    config = function()
      require("im_select").setup {}
    end,
  },
  {
    "machakann/vim-sandwich",
    keys = {
      { "sa", mode = { "n", "v" } },
      { "sd", mode = { "n", "v" } },
      { "sr", mode = { "n", "v" } },
    },
  },
  {
    "wellle/targets.vim",
    keys = {
      { "a", mode = { "x", "o" } },
      { "i", mode = { "x", "o" } },
    },
  },
  {
    "ggandor/leap.nvim",
    keys = {
      { "f", "<Plug>(leap)", noremap = true, mode = { "n", "v", "o" } },
    },
  },
  { "tpope/vim-sleuth", lazy = false },
  { "tpope/vim-repeat", keys = "." },
  {
    "johmsalas/text-case.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("textcase").setup {}
      -- require("telescope").load_extension "textcase"
    end,
    keys = {
      "ga", -- Default invocation prefix
      -- { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "x" }, desc = "Telescope" },
    },
    cmd = {
      -- NOTE: The Subs command name can be customized via the option "substitude_command_name"
      "Subs",
      "TextCaseOpenTelescope",
      "TextCaseOpenTelescopeQuickChange",
      "TextCaseOpenTelescopeLSPChange",
      "TextCaseStartReplacingCommand",
    },
    -- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
    -- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
    -- available after the first executing of it or after a keymap of text-case.nvim has been used.
    -- lazy = false,
  },
  -- }}}
  -- Knowledge Management {{{
  {
    "vhyrro/luarocks.nvim",
    priority = 1001,
    opts = {
      rocks = { "magick" },
    },
    config = true,
  },

  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    -- version = "*", -- Pin Neorg to the latest stable release
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {},
          ["core.export"] = {},
          ["core.export.markdown"] = {},
          ["core.concealer"] = {},
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
          ["core.dirman"] = {
            config = {
              workspaces = {
                knowledge = "~/Documents/Knowledge/Notes Base",
              },
              default_workspace = "knowledge",
            },
          },
          ["core.integrations.image"] = {},
          ["core.latex.renderer"] = {},
        },
      }
    end,
  },
  -- {
  --   "nvim-orgmode/orgmode",
  --   event = "VeryLazy",
  --   ft = "org",
  --   config = function()
  --     -- Setup orgmode
  --     require("orgmode").setup {
  --       org_agenda_files = "~/Documents/notes/org/agenda/**/*",
  --       org_default_notes_file = "~/Documents/notes/org/refile.org",
  --     }
  --   end,
  -- },
  -- {
  --   "chipsenkbeil/org-roam.nvim",
  --   event = "VeryLazy",
  --   ft = "org",
  --   tag = "0.1.0",
  --   dependencies = {
  --     {
  --       "nvim-orgmode/orgmode",
  --       tag = "0.3.4",
  --     },
  --   },
  --   config = function()
  --     -- vim.keymap.del("n", "<leader>n")
  --     require("org-roam").setup {
  --       directory = "~/Documents/notes/org/roam",
  --     }
  --   end,
  -- },
  -- }}}
  -- Typesetting {{{
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      require("which-key").add {
        { "<localleader>p", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle markdown preview" },
      }
      vim.g.mkdp_browser = "thorium-browser"
      vim.g.mkdp_theme = "dark"
    end,
    ft = "markdown",
  },
  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      -- NOTE: https://github.com/lervag/vimtex/issues/2046
      vim.g.vimtex_view_method = pdf_viewer
    end,
  },
  {
    "kaarmu/typst.vim",
    ft = "typst",
    config = function()
      vim.g.typst_pdf_viewer = pdf_viewer
    end,
  },
  -- }}}
  -- Languages {{{
  -- Oil {{{
  {
    "glyh/vim-oil",
    ft = "ysh",
  },
  -- }}}
  -- Clojure {{{
  {
    "eraserhd/parinfer-rust",
    ft = lispy_filetypes,
    build = "cargo build --release",
  },
  {
    "julienvincent/nvim-paredit",
    ft = lispy_filetypes,
    config = function()
      require("nvim-paredit").setup()
    end,
  },
  {
    "Olical/conjure",
    lazy = false,
    config = function()
      require "configs.conjure"
    end,
  },
  -- }}}
  -- FSharp {{{
  {
    "ionide/Ionide-vim",
    ft = "fsharp",
    enabled = false,
  },
  -- }}}
  -- Flutter {{{
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("flutter-tools").setup {}
    end,
  },
  -- }}}
  -- Crystal {{{
  -- Don't use crystal:
  -- 1. bad ADT support
  -- 2. bad LSP support
  -- {
  --   "jlcrochet/vim-crystal",
  --   ft = "crystal",
  -- },
  -- }}}
  -- Moonbit {{{
  {
    "moonbit-community/moonbit.nvim",
    ft = { "moonbit" },
    dependencies = {
      "mfussenegger/nvim-lint", -- for linting support
    },
    opts = {},
  },
  -- }}}
  -- Haskell {{{
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^4", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  -- }}}

  -- Antlr {{{
  {
    "dylon/vim-antlr",
    ft = { "antlr3", "antlr4" },
  },
  -- }}}
}
