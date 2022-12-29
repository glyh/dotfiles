-- Some general mappings
-- Principle: Avoid Ctrl, Meta, Esc and keys that are fucking hard to touch!

-- Layout
vim.api.nvim_set_keymap('c', 'hp', 'help', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>s', '<cmd>split<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>v', '<cmd>vsplit<CR>', {noremap = true})

-- Navigation
vim.api.nvim_set_keymap('n', '<leader>j', '<C-f>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>k', '<C-b>', {noremap = true})

local fmt = string.format
for fr, to in pairs({h = 'h', j = 'j', k = 'k', l = 'l'}) do
  vim.api.nvim_set_keymap('t', fmt('<A-%s>', fr), fmt([[<C-\><C-N><C-w>%s]], to), {noremap = true})
  vim.api.nvim_set_keymap('n', fmt('<A-%s>', fr), fmt([[<C-w>%s]], to), {noremap = true})
end

-- Quit
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>qa<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>q<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>wq<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'g<leader>', '2g;', {noremap = true})

-- Normal
-- In case arpeggio is not installed
-- Conflicts with luasnip in visual select mode
-- pcall(function()
--   vim.fn["arpeggio#map"]('i', '', 0, 'jk', '<Esc>')
-- end)

-- Terminal
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], {noremap = true})

-- Command
vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})

-- LSP
-- vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})
vim.api.nvim_set_keymap('n', 'K', '',
  {callback = function()
    vim.lsp.buf.hover()
   end,
   noremap = true})
