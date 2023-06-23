local wk = require('which-key')

wk.register({
  [';'] = {':', 'Enter command mode', opts = { nowait = true }},
}, {})

wk.register({
  hp = { 'help' , 'Ask for help' },
}, { mode = 'c' })

local function vsplit_new_file()
  vim.cmd('vnew')
  require('telescope.builtin').find_files()
end

local function ssplit_new_file()
  vim.cmd('new')
  require('telescope.builtin').find_files()
end

wk.register({
  j = { '<C-f>' , 'Go down a page' },
  k = { '<C-b>' , 'Go up a page' },


  w = { name = 'window',
    v = { vsplit_new_file , 'New vertical split with a file' },
    s = { ssplit_new_file , 'New horizontal split with a file' },
    t = { function() require("nvterm.terminal").new "vertical" end, 'New horizontal terminal' }
  },

  b = {
    name = 'buffer',
    v = { '<cmd>vnew<CR>', 'Open a new buffer on the rght'},
    s = { '<cmd>new<CR>', 'Open a new buffer on below'},
    q = { '<cmd>qa<CR>', 'Close all buffer' },
    b = { '<cmd>q<CR>', 'Close current buffer' },
    w = { '<cmd>wq<CR>', 'Save and close current buffer' },
  },

  m = {
    name = 'make',
    r = {function() require('overseer').run_template {prompt = "always"} end, 'Run an overseer template' },
    t = {function() require('overseer').toggle() end, 'Run an overseer command' },
  },

  f = {
    name = 'finder/toggle',
    t = { function() require('nvim-tree.api').tree.toggle() end, 'Toggle file tree'},
    q = { function() require('trouble').toggle() end, 'Toggle quick fix'},
    s = { function() require('telescope').extensions.themes.themes() end, 'Toggle colorscheme'},
    p = { '<Cmd>Telescope projects<CR>', 'Find projects' },
    f = { '<Cmd>Telescope find_files<CR>', 'Find files' },
    k = { '<Cmd>Telescope marks<CR>', 'Find bookmarks' },
    b = { function() require('reach').buffers() end, 'Find buffers' },
    u = { '<Cmd>NvChadUpdate<CR>' , 'Update NvChad' },
    l = { '<Cmd>Lazy<CR>' , 'Show Lazy' },
    m = { '<Cmd>Mason<CR>' , 'Show Mason' },
  },

  g = {
    name = 'git',
    c = { function() require('telescope.builtin').git_commits() end, 'Git commits'},
    -- d = {}
    d = { function() require('gitsigns').toggle_deleted() end, 'Toggle deleted' },
    h = {
      name = 'hunk',
      p = { function() require('gitsigns').preview_hunk() end, 'Preview hunk' },
      k = { function() require('gitsigns').prev_hunk() end, 'Jump to previous hunk' },
      j = { function() require('gitsigns').next_hunk() end, 'Jump to next hunk' },
      r = { function() require('gitsigns').reset_hunk() end, 'Reset hunk' },
    }
  },
}, { prefix = '<leader>' })

wk.register({
  ['<leader>'] = { '2g;', 'Toggle between last position and current.'}
}, { prefix = 'g' })

local fmt = string.format
for key, direction in pairs({h = 'left', j = 'down', k = 'right', l = 'up'}) do
  wk.register({ [key] = { fmt('<C-w>%s', key), "Switch to window on the " .. direction }}, {prefix = '<leader>w'})
  wk.register({ [key] = { fmt([[<C-\><C-N><C-w>%s]], key), "Switch to window on the " .. direction }}, {prefix = '<leader>w', mode = 't' })
end
