-- This file runs before any config

vim.opt.termguicolors = true

vim.g.maplocalleader = ','
-- vim.g.did_load_filetypes = 1

_G.GITHUB = vim.env["GITHUB"] or "github.com"

vim.opt.cmdheight = 0

-- local enable_providers = {
--   "python3_provider",
--   -- "node_provider",
--   -- and so on
-- }
--
-- for _, plugin in pairs(enable_providers) do
--   vim.g["loaded_" .. plugin] = nil
--   vim.cmd("runtime " .. plugin)
-- end


vim.opt.clipboard = "unnamedplus"

if vim.fn.has('wsl') == 1 then
  vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('Yank', { clear = true }),
    callback = function()
      vim.fn.system('clip.exe', vim.fn.getreg('"'))
    end,
  })
end
