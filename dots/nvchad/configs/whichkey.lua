local wk = require('which-key')

wk.register({
  [';'] = {':', 'Enter command mode', opts = { nowait = true }},
}, {})

wk.register({
  hp = { 'help' , 'Ask for help' },
}, { mode = 'c' })

local function vsplit_new_file()
  vim.cmd('vsplit')
  require('telescope.builtin').find_files()
end

local function ssplit_new_file()
  vim.cmd('split')
  require('telescope.builtin').find_files()
end

local function reach_buf()
  local reach_options = {
    handle = 'auto',              -- 'bufnr' or 'dynamic' or 'auto'
    show_icons = true,
    show_current = false,         -- Include current buffer in the list
    show_modified = true,         -- Show buffer modified indicator
    modified_icon = '⬤',          -- Character to use as modified indicator
    grayout_current = true,       -- Wheter to gray out current buffer entry
    force_delete = {},            -- List of filetypes / buftypes to use
                                  -- 'bdelete!' on, e.g. { 'terminal' }
    filter = nil,                 -- Function taking bufnr as parameter,
                                  -- returning true or false
    sort = nil,                   -- Comparator function (bufnr, bufnr) -> bool
    terminal_char = '\\',         -- Character to use for terminal buffer handles
                                  -- when options.handle is 'dynamic'
    grayout = true,               -- Gray out non matching entries

    -- A list of characters to use as handles when options.handle == 'auto'
    auto_handles = require('reach.buffers.constant').auto_handles,
    auto_exclude_handles = {},    -- A list of characters not to use as handles when
                                  -- options.handle == 'auto', e.g. { '8', '9', 'j', 'k' }
    previous = {
      enable = true,              -- Mark last used buffers with specified chars and colors
      depth = 2,                  -- Maximum number of buffers to mark
      chars = { '•' },            -- Characters to use as markers,
                                  -- last one is used when depth > #chars
      groups = {                  -- Highlight groups for markers,
        'String',                 -- last one is used when depth > #groups
        'Comment',
      },
    },
    -- A map of action to key that should be used to invoke it
    actions = {
      split = '-',
      vertsplit = '|',
      tabsplit = ']',
      delete = '<Space>',
      priority = '=',
    },
  }

  require('reach').buffers(reach_options)
end

wk.register({
  j = { '<C-f>' , 'Go down a page' },
  k = { '<C-b>' , 'Go up a page' },

  v = { vsplit_new_file , 'New vertical split with a file' },
  s = { ssplit_new_file , 'New horizontal split with a file' },

  u = { '<Cmd>NvChadUpdate<CR>' , 'Update NvChad' },
  l = { '<Cmd>Lazy<CR>' , 'Show Lazy' },

  f = {
    name = 'finder',
    p = { '<Cmd>Telescope projects<CR>', 'Find projects' },
    f = { '<Cmd>Telescope find_files<CR>', 'Find files' },
    m = { '<Cmd>Telescope marks<CR>', 'Find bookmarks' },
    b = { reach_buf, 'Find buffers' },
  },

  m = {
    name = 'make',
    r = {function() require('overseer.commands')._run_command({}) end, 'Run an overseer command' },
    t = {function() require('overseer.commands')._toggle({}) end, 'Run an overseer command' },
  },

  q = {
    name = 'quit',
    q = { '<cmd>qa<CR>', 'Close all buffer' },
    b = { '<cmd>q<CR>', 'Close current buffer' },
    w = { '<cmd>wq<CR>', 'Save and close current buffer' },
  },

  w = { name = 'window' },
  g = { name = 'git' },
}, { prefix = '<leader>' })

wk.register({
  ['<leader>'] = { '2g;', 'Toggle between last position and current.'}
}, { prefix = 'g' })

local fmt = string.format
for key, direction in pairs({h = 'left', j = 'down', k = 'right', l = 'up'}) do
  wk.register({ [key] = { fmt('<C-w>%s', key), "Switch to window on the " .. direction }}, {prefix = '<leader>w'})
  wk.register({ [key] = { fmt([[<C-\><C-N><C-w>%s]], key), "Switch to window on the " .. direction }}, {prefix = '<leader>w', mode = 't' })
end
