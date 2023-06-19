-- vim:foldmethod=marker
-- Constants {{{

_G.GITHUB = vim.env["GITHUB"] or "github.com"
-- }}}

-- Options {{{
vim.opt.completeopt = 'menuone,noselect'
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.hidden = true
vim.opt.laststatus = 2
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

-- }}}

-- Globals {{{ 
vim.g.mapleader = ' '
vim.g.maplocalleader = ','
-- }}}

-- Bootstrapping lazy {{{
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
--  "https://github.com/folke/lazy.nvim.git",
    'https://' .. _G.GITHUB .. '/folke/lazy.nvim.git',
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- }}}

require('lazy').setup('plugins')
require('mapping')

-- vim.api.nvim_create_autocmd(
