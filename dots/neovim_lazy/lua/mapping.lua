local function vsplit_new_file()
  vim.cmd('vsplit')
  require('telescope.builtin').find_files()
end

local function ssplit_new_file()
  vim.cmd('split')
  require('telescope.builtin').find_files()
end

local wk = require('which-key')

wk.register({
  [';'] = {':', 'Enter command mode', opts = { nowait = true }},
}, {})

wk.register({
  hp = { 'help' , 'Ask for help' },
}, { mode = 'c' })

wk.register({
  j = { '<C-f>' , 'Go down a page' },
  k = { '<C-b>' , 'Go up a page' },

  v = { vsplit_new_file , 'New vertical split with a file' },
  s = { ssplit_new_file , 'New horizontal split with a file' },

  u = { '<Cmd>Lazy sync<CR>' , 'Update ueovim' },

  fp = { '<Cmd>Telescope projects<CR>', 'Find projects' },
  ff = { '<Cmd>Telescope find_files<CR>', 'Find files' },
  fb = {function() require('reach').buffers() end, 'Find buffers' },

  oo = {'<Cmd>OverseerRun<CR>', 'Run an overseer command' },
  ot = {'<Cmd>OverseerToggle<CR>', 'Toggle overseer output' },

  qa = { '<cmd>qa<CR>', 'Close all buffer' },
  qq = { '<cmd>q<CR>', 'Close current buffer' },
  qw = { '<cmd>wq<CR>', 'Save and quit' }

}, { prefix = '<leader>' })

wk.register({
  ['<leader>'] = { '2g;', 'Toggle between last position and current.'}
}, { prefix = 'g' })

local fmt = string.format
for key, direction in pairs({h = 'left', j = 'down', k = 'right', l = 'up'}) do
  wk.register({ [key] = { fmt('<C-w>%s', key), "Switch to window on the " .. direction }}, {prefix = '<leader>w'})
  wk.register({ [key] = { fmt([[<C-\><C-N><C-w>%s]], key), "Switch to window on the " .. direction }}, {prefix = '<leader>w', mode = 't' })
end
