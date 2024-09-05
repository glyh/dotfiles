require "nvchad.mappings"

vim.keymap.del("n", "<leader>n")
vim.keymap.del("n", "<Tab>")

local wk = require "which-key"

wk.add {
  { ";", ":", desc = "Enter command mode" },
  { "hp", "vert help", desc = "Ask for help", mode = "c" },
}

local function vsplit_new_file()
  vim.cmd "vnew"
  require("telescope.builtin").find_files()
end

local function ssplit_new_file()
  vim.cmd "new"
  require("telescope.builtin").find_files()
end

wk.add {
  { "<leader>j", "<C-f>", desc = "Go down a page" },
  { "<leader>k", "<C-b>", desc = "Go up a page" },
}

-- Neorg bindings
wk.add {
  { "<leader>n", group = "neorg" },
  { "<leader>ni", "<cmd>Neorg index<CR>", desc = "Jump to Neorg Index" },
  { "<leader>nr", "<cmd>Neorg return<CR>", desc = "Return from Neorg" },
  -- TODO: this should be local key binding
  -- c = { "<cmd>Neorg toggle-concealer", "Toggle concealer" },
}

wk.add {
  { "<leader>w", group = "window" },
  { "<leader>wv", vsplit_new_file, desc = "New vertical split with a file" },
  { "<leader>ws", ssplit_new_file, desc = "New horizontal split with a file" },
  {
    "<leader>wt",
    function()
      require("nvterm.terminal").new "vertical"
    end,
    desc = "New horizontal terminal",
  },
  { "<leader>wf", "<cmd>NvimTreeFocus<CR>", desc = "Focus NvimTree" },
  { "<leader>wg", "<cmd>NvimTreeClose<CR>", desc = "Close NvimTree" },
}

wk.add {
  { "<leader>b", group = "buffer" },
  { "<leader>bx", "<cmd>q<CR>", desc = "Close current buffer" },
  { "<leader>bq", "<cmd>qa<CR>", desc = "Close all buffer" },
  { "<leader>bs", "<cmd>new<CR>", desc = "Open a new buffer on below" },
  { "<leader>bv", "<cmd>vnew<CR>", desc = "Open a new buffer on the rght" },
  { "<leader>bw", "<cmd>wq<CR>", desc = "Save and close current buffer" },
}

wk.add {
  { "<leader>m", group = "make" },
  {
    "<leader>mr",
    function()
      require("overseer").run_template { prompt = "always" }
    end,
    desc = "Run an overseer template",
  },
  {
    "<leader>mt",
    function()
      require("overseer").toggle()
    end,
    desc = "Run an overseer command",
  },
}

wk.add {
  { "<leader>f", group = "finder/toggle" },
  { "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
  { "<leader>fk", "<Cmd>Telescope marks<CR>", desc = "Find bookmarks" },
  { "<leader>fl", "<Cmd>Lazy<CR>", desc = "Show Lazy" },
  { "<leader>fm", "<Cmd>Mason<CR>", desc = "Show Mason" },
  { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Find projects" },
  { "<leader>fu", "<Cmd>Lazy update<CR>", desc = "Update NvChad" },
  {
    "<leader>fb",
    function()
      require("reach").buffers()
    end,
    desc = "Find buffers",
  },
  {
    "<leader>fq",
    function()
      require("trouble").toggle "diagnostics"
    end,
    desc = "Toggle quick fix",
  },
  {
    "<leader>fs",
    function()
      require("telescope").extensions.themes.themes()
    end,
    desc = "Toggle colorscheme",
  },
  {
    "<leader>ft",
    function()
      require("nvim-tree.api").tree.toggle()
    end,
    desc = "Toggle file tree",
  },
}

wk.add {
  { "<leader>g", group = "git" },
  {
    "<leader>gc",
    function()
      require("telescope.builtin").git_commits()
    end,
    desc = "Git commits",
  },
  {
    "<leader>gd",
    function()
      require("gitsigns").toggle_deleted()
    end,
    desc = "Toggle deleted",
  },
  { "<leader>gh", group = "hunk" },
  {
    "<leader>ghj",
    function()
      require("gitsigns").next_hunk()
    end,
    desc = "Jump to next hunk",
  },
  {
    "<leader>ghk",
    function()
      require("gitsigns").prev_hunk()
    end,
    desc = "Jump to previous hunk",
  },
  {
    "<leader>ghp",
    function()
      require("gitsigns").preview_hunk()
    end,
    desc = "Preview hunk",
  },
  {
    "<leader>ghr",
    function()
      require("gitsigns").reset_hunk()
    end,
    desc = "Reset hunk",
  },
}

wk.add {
  { "g<leader>", "2g;", desc = "Toggle between last position and current." },
}

local fmt = string.format
for key, direction in pairs { h = "left", j = "down", k = "right", l = "up" } do
  wk.add {
    { fmt("<leader>w%s", key), fmt("<C-w>%s", key), desc = "Switch to window on the " .. direction },

    {
      fmt("<leader>w%s", key),
      fmt([[<C-\><C-N><C-w>%s]], key),
      desc = "Switch to window on the " .. direction,
      mode = "t",
    },
  }
end
